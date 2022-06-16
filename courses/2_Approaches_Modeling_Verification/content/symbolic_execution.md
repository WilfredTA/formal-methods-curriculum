# Symbolic Execution

## Basic Concepts

*Symbolic execution* is a program analysis technique which explores multiple execution paths at the same time. If a program is run *concretely*, i.e., on a specific *concrete* input, a single control flow path of this program is explored. In contrast, symbolic execution assigns *symbolic*—rather than concrete—values to input variables that determine which paths should be be executed. A symbolic value represents an arbitrary value that can be assigned to a variable. Symbolic execution can therefore be viewed as a way to generalize testing.

For each explored control flow path of a program, a symbolic execution *engine*  maintains (1) a *path condition*—a first-order logic formula over variable values that captures the conditions satisfied by the branches taken along that path, and (2) a *symbolic memory store* that maps variables to symbolic expressions or values computed along that paths. An execution of a branch statement updates the path condition, while an assignment updates the store.

Symbolic execution is commonly used to check whether a certain property can be violated by any program execution, i.e., if a certain vulnerable state is reachable. To determine state reachability, symbolic execution engines typically rely on an off-the-shelf [satisfiability modulo theories](https://en.wikipedia.org/wiki/Satisfiability_modulo_theories) (SMT) solver, such as [Z3](https://github.com/Z3Prover/z3). Since reachability of a state corresponds to the feasibility of a path leading to it, the path condition is given to an SMT solver to check its satisfiability. An SMT solver either finds a satisfying concrete assignment to symbolic variables, thus demonstrating path feasibility, or proves that a formula is unsatisfiable, indicating that no satisfying assignment exists and the path is infeasible.
An SMT-solver can also be used to generate concrete program inputs that will cause a specific paths to execute, which can be used to automatically generate test cases.

## Example

Consider the toy smart contract function shown in Fig. 1. `deposit()` implements a swap between some tokens `In` and `Out`. The function's input parameters `_in` and `_out` correspond to the amount of `In` provided by the caller and the amount of `Out` he expects to receive in return, respectively. The swap should only occur if the caller sends in more tokens than he withdraws (`_in >= _out`) *and* if there are enough tokens `Out` in the smart contract (`_out <= balance_out`, *line 4*).
The transfer of tokens is imitated by changes in the `In` and `Out` balances of a smart contract, represented by `balance_in` and `balance_out` variables (*lines 6, 11*).
For the transfer of `In` to succeed, the caller must *approve* spending of *at least* the `_in` amount of his `In` tokens. The number of *approved* tokens is captured by the `_appr` input parameter, therefore, this requirement translates to `_appr >= _in` (*line 5*). If it does not hold, the function execution should revert—however, this functionality is missing from the implementation (*line 9*).

```cpp
 1  function deposit(uint _in, uint _out, uint _appr) public {
 2     uint balance_in = 100; uint balance_out = 100;
 3 
 4     if (_in >= _out && _out <= balance_out) {
 5         if (_approved >= _in) {
 6             balance_in += _in;
 7             _appr -= _in;
 8         }
 9         // { else revert(); }
10 
11         balance_out -= _out;
12     }
13     
14     assert(balance_in + balance_out >= 200);
15  }
```
<p align = "center">
Fig. 1. Smart contract example
</p>

If the function was implemented correctly, the sum of `balance_in` and `balance_out` would be non-decreasing due to the `_in >= _out` constraint.
For now, let's ignore possible integer underflow and overflow issues that might occur during arithmetic operations in lines 6, 7, 11 *(NB: these assumptions do not hold in practice)*.
If, for simplicity, we set `balance_in` and `balance_out` to `100` (*line 2*), the following condition should always evaluate to *true*: `assert(balance_in + balance_out >= 200)` (*line 14*).

However, this smart contract lets a caller get free `Out` tokens if he does not approve enough `In` tokens, i.e., if `_approved >= _in` evaluates to *false*. It fact, this example replicates a (significantly simplified) version of an *unchecked return value* issue, which enabled a [$34 million exploit](https://blog.forcedao.com/xforce-exploit-post-mortem-7fa9dcba2ac3) of the Force DAO DeFi protocol.

Let's see how the violation of `balance_in + balance_out >= 200` (*line 14*) could have been identified using symbolic execution. Figure 2 illustrates the process of symbolically executing function `deposit()` statement by statement.

*This description and illustration are heavily inspired by the survey of symbolic execution techniques by Baldoni et al. [1]*

![Symbolic execution process](/courses/2_Approaches_Modeling_Verification/assets/se_example.jpg)
<p align = "center">
Fig. 2. Symbolic execution tree of <font style="font-family:'Courier New'">deposit()</font>
</p>


In the initial state, the path constraints $\pi$ are *true* and input parameters `_in`, `_appr`, and `_out` and are assigned symbolic (i.e., arbitary) values $\alpha, \beta$,
and $\gamma$ respectively.
Line 2 initializes variables `balance_in` and `balance_out`, which updates the symbolic store $\sigma$ by associating corresponding variables $bal\_in$
and $bal\_out$ with a concrete value $100$.
A conditional branch in line 4 forks further execution into two subtrees. When a *true* branch is taken, the constraint from line 4 (in symbolic terms) is added to the path conditions, which become $\pi = \alpha\geq\gamma\;\wedge\;\gamma\leq100$. In the next statement, the execution forks again depending on the order relation between symbolic variables $\beta$
and $\alpha$, corresponding to `_appr` and `_in` variables, respectively.
When a *false* branch is taken, the *negation* of a branch condition is added to path conditions—for example, if `(_appr >= _in)` does not hold, the path condition is updated as follows: $\pi = \alpha\geq\gamma\;\wedge\;\gamma\leq100\wedge\;\neg(\beta\geq\alpha).$
Other lines of code perform assignments and arithmetic operations on smart contract variables and, therefore, update the symbolic state during evaluation.

The goal of the symbolic execution here is to identify possible assertion violations. As discussed above, it manifests in a satisfiability of a logical formula constructed from as a conjunction of a path condition and a negation of the asserted expression that should always hold.
After unrolling all execution traces of our example smart contract, we can conclude that one trace does reach a state where this formula is satisfiable. The assertion can be violated if line 6 doesn't get executed, but line 11 does—in other words, if the caller did not approve the transfer of any `In` but received the requested `Out` tokens. An SMT solver used to determine satisfiability of path constraints can also suggest concrete input values corresponding to this execution path: for example, `_in = 100; _appr = 0; _out = 90;`.

## Installation

Exercise 1 involves the usage of [Manticore](https://github.com/trailofbits/manticore/tree/master/manticore)—a symbolic execution framework developed in Python by Trail of Bits.
An Exercise 2 utilizes [Z3](https://github.com/Z3Prover/z3) and its Python API as an off-the-shelf SMT-solver.

## Challenges in Symbolic Execution

Although useful for various analyses, exhaustive exploration of all possible execution paths performed by symbolic execution comes with certain performance and scalability constraints.

The challenges include:
- Handling state space explosion (the number of states grows exponentially in the number of system components, and exploring smart contracts with, e.g., loops and recursive calls might be infeasible within reasonable resource constraints)
- Constraint solving (certain types of constraints pose a difficulty to SMT solvers—these include non-linear arithmetic expressions which are common in DeFi smart contracts, e.g., the Uniswap invariant)
- Modeling memory (which can be fully symbolic, partially symbolic, or concretized)
- Interaction with the environment (e.g., calling other smart contracts and accounting for possible side effects)

## Existing Tools

Symbolic execution has been widely used to identify smart contract vulnerabilities, e.g., in [Oyente](https://github.com/enzymefinance/oyente), [Mythril](https://github.com/ConsenSys/mythril), [Osiris](https://github.com/christoftorres/Osiris), [HoneyBadger](https://github.com/christoftorres/HoneyBadger), [Maian](https://github.com/ivicanikolicsg/MAIAN), [teEther](https://github.com/nescio007/teether).

Property-based symbolic execution is supported by [Manticore](https://github.com/trailofbits/manticore).

## References
[1] R. Baldoni, E. Coppa, D. C. D'Elia, C. Demetrescu, and A. Finocchi. 2018. Survey of Symbolic Execution Techniques. ACM Computing Surveys. https://arxiv.org/pdf/1610.00502.pdf

[2] J. C. King. 1976. Symbolic execution and program testing. ACM Communications. https://madhu.cs.illinois.edu/cs598-fall10/king76symbolicexecution.pdf

[3] Trail of Bits. 2020. "How to use Manticore to find bugs in smart contracts". https://ethereum.org/en/developers/tutorials/how-to-use-manticore-to-find-smart-contract-bugs/

