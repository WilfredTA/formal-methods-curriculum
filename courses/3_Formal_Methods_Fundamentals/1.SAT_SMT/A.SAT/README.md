# SAT

## Introduction

SAT, short for *satisfiability*, is the name given to the problem of determining whether a certain Boolean formula can be satisfied.
By satisfiable it is meant whether by replacing the variables that make up the Boolean formula by TRUE or FALSE the formula evaluates to TRUE. In case such a combination is possible the formula is called *satisfiable*.

Most students will remember this problem from high-school or undergrad courses, but maybe they've learned it with a different name in the past.

An example of a satisfiable formula is "A \/ B" (where \/ means or), which can be satisfied for example by assigning values A = TRUE, B = TRUE.

An example of a non-satisfiable formula is "A /\ -A", where no combination of assignement of values to the formula variables will lead to a case where the formula is TRUE.

## Instalation:

To learn about SAT we're going to install a SAT solver, MiniSat.

http://minisat.se/MiniSat.html

## Tutorial

First some theory on SAT:

https://www.borealisai.com/en/blog/tutorial-9-sat-solvers-i-introduction-and-applications/

This webpage goes through the basics of SAT, which is enough theoretical background to solve the following exercises.

If one intends to dig deeper into SAT we recommend the following book:

"Handbook of Satisfiability" which can be found here https://www.amazon.com/Handbook-Satisfiability-Artificial-Intelligence-Applications/dp/1586039296.

Now to encode some of the theory we learned and practice with MiniSat.

First learn about the standard SAT encoding DNF format: https://people.sc.fsu.edu/~jburkardt/data/cnf/cnf.html.

Can you encode the correct constraints in DNF format of the N Queens Puzzle, when n=8?
Read about the n queens puzzle here: https://en.wikipedia.org/wiki/Eight_queens_puzzle
eight

(A solution to this exercise can be found here: https://github.com/vivekkvvermaindia/NQueens-Puzzle-using-MiniSAT)

Then go through this list of solved exercises:

- [ ] http://disi.unitn.it/~ldkr/ml2014/slides/minisat-exercizes.pdf
