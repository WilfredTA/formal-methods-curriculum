### **Exercise 2.** Developing Symbolic Execution Tools for EVM Using Z3

The goal of this exercise is to familiarize yourself with the details of symbolic execution techniques. In contrast to [Exercise 1](https://colab.research.google.com/drive/17oyX0mL9TtpjPUQEYO4h_GwyW1A8V8r6?usp=sharing) where we have utilized the API of an existing symbolic execution tool, this exercise is focused on building our our EVM-level symbolic execution engine using [Z3](https://github.com/Z3Prover/z3) as a constraint solver.

*The exercise and the accompanying tutorial are heavily based on (1) [Z3 Tutorial](https://colab.research.google.com/github/philzook58/z3_tutorial/blob/master/Z3%20Tutorial.ipynb) by Philip Zucker and the (2) [EVM Symbolic Execution tutorial](https://github.com/williamberman/evm-symbolic-execution/blob/master/EVM%20Symbolic%20Execution.ipynb) by William Berman.*

#### **Jupyter Notebook**

The Z3 tutorial and practical exercises are available as a Jupyter [notebook](https://drive.google.com/file/d/1X8E5d82dWT-bY4xcvGNtZnJPVGATnzN2/view?usp=sharing) in Google Colab.

#### **Local Installation**

The exercise requires Python 3.7.
Z3 can be installed using `pip`:

`pip install z3-solver`
