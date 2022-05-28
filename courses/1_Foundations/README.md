# Course 1: Foundations of Proof Engineering

The intention of this course is to provide a resource of practical formal verification tailored for self-directed learning. As the field of software engineering (and blockchain in particular) continues to grow in popularity, so too does the diversity of backgrounds of those who enter the field. Thus, there is a need for high quality, open source & freely accessible materials on computer science fundamentals. Not only is there a need amongst the self-taught for structured & quality coverage of CS fundamental topics; there is a need across CS education in *general* for education materials that not only teach the fundamentals, but teach students the means by which such fundamental concepts can be effectively *applied*.

The coverage of topics in this course is a mixture of topics one would find in an introductory course on Discrete Math (with an emphasis on proofs), formal languages, and protocol & systems engineering. In a typical curriculum, these topics are covered in separate courses, related by a strict ordering of pre-requisites. While the overall curriculum of Formal Methods for DeFi Engineering is designed to be followed sequentially by course number, the sets of topics covered in each course are largely overlapping, with the major difference between a course and its successor being the depth at which topics are generally covered as well as the degree of emphasis on one topic or another. In this way, the progression through the curriculum is analogous to a breadth-first traversal of a tree.

There is another large benefit to this course for those interested in CS fundamentals & discrete mathematics in a more general (non-blockchain) sense: the use of the Athena proof language.  Most exercises and examples in this course are written in both the traditional mathematical format as well as Athena code. This provides readers with a remedy to one of the most significant challenges that face aspiring self-taught software engineers: the importance of feedback. It is very difficult to learn mathematics when, traditionally, feedback on erroneous solutions is provided by a professor who manually grades assignments. The reliance on a human grader not only creates a longer feedback loop; it also limits the amount of iterations one has access to.

With Athena, mathematical expressions & proofs can be checked instantly on one's own computer, allowing for quicker feedback loops and thus the ability to practice many more problems than a professor can afford to grade.

There are many reasons Athena was chosen for this course. Chief among them are:
1. Proofs written with the Athena language more closely resemble the natural deduction style "proofs on paper" than the other available computer-aided proof tools available. This fact removes the additional cognitive burden of learning a complicated formal theory - such as the theory of dependent types - on which many other tools are based.
2. Athena is designed for *proof engineering*. I.e., Athena's module structure and abstraction mechanisms make it suitable for handling the *development* and *maintenance* of large and complicated proofs or theories.
3. Athena is powerful enough for industrial use, and is currently being applied to *multiple* blockchain security related efforts. Thus, those who complete this curriculum and wish to enter the field as a professional need not switch from a 'pedagogical' to a 'professional' tool.

# Overview

We will cover the following topics, module by module:

## Module 1: Logic & Proofs
This course provides an introduction to propositional and predicate logic as languages to aid in rigorous reasoning. We will develop many proofs throughout this module of varying size & complexity. This module also covers equational reasoning which uses the notion of *equality* between expressions. We will learn how powerful equational reasoning is, especially as a foundation of *rewrite systems* which have a nice property that allows us not only to formally specify a system, but to actually execute our specification.

## Module 2: Recursion and Induction
In this module we cover the principles of mathematical and strong induction. We practice many inductive proofs since induction is such a useful tool in computer science. On the other side of the coin, we will cover recursive programming and recursive definitions of mathematical structures and recurrence relations.


## Module 3: Computation, Automata and Languages
This chapter introduces models of computation, the problems they solve, the challenges they pose, and their application in areas such as programming language design and verification. We will cover interesting structures such as various classes of automata (i.e., "state machines"), regular & context-free languages, and important properties about such structures. We will also cover concepts such as decidability, computability, satisfiability and semantics. 

# Exercises & Tools

The primary tool used in this course is Athena. Please download and install the latest [Athena distribution](https://github.com/AthenaFoundation/athena/releases/tag/v1.4.1) for your system before continuing to Module 1.

