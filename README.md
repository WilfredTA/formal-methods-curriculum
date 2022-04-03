# Formal Methods for DeFi Developers

## Introduction
This repository contains a course sequence for training developers in the use & development of formal methods and formal tools.

Later material in the curriculum will more greatly emphasize blockchain applications & DeFi, while earlier material is more agnostic (though still contains blockchain-specific material in certain parts).

The curriculum assumes basic familiarity with logic and general computer science concepts such as propositional logic, basic set theory, algorithms. The first set of material does cover fundamentals, but the fundamentals build upon the concepts listed above and will not review them. See `external_resources/fundamentals.md` for a recommended list of resources about the above material if you'd like a refresher.


## Philosophy
This course is designed with a general goal of providing a comprehensive resource to onboard blockchain developers to formal methods research and development. The blockchain industry is still quite new. It naturally has attracted people from all sorts of diverse technical backgrounds. Simultaneously, blockchain & DeFi are considered financially critical software since it is used to store billions of dollars worth of value. 

There is *a lot* of important research yet to be done on effectively integrating safety assurance methodologies & technologies into blockchain developer workflows. We believe this industry will benefit not only from increased adepthood in *using* formal tools, but understanding their theoretical foundations as well. Given the industry's age, there is less maturity in developer tools in general, as well as formal tools more specifically (let alone the integration between the two). Further, the primary products in the industry (distributed protocols as well as dapps), run in open, permissionless, adversarial environments. 

Managing complexity in software is a difficult issue as it is. Managing complexity in blockchain & DeFi software is especially difficult and failing to do so is especially detrimental. This leaves all participants in a precarious position: caught between the rapid pace of innovation, the imperative for a fair global financial system, and the need to pursue the latter while keeping pace with the former... all while preserving the strict safety guarantees necessary when building financially critical software.

# Course Sequence & Outcomes

## Course 1: Mathematical Foundations 

**Description**: This course explains the fundamental mathematical concepts and conventions that developers will need to effectively consume the rest of the course material as well as research on formal methods more generally. This course includes material on the following topics:

- Set theory
- First-order logic 
- Mathematical modeling
- Algebraic & Equational reasoning
- Deductive & Inductive proof methods


**Outcomes**: Developers who complete this course should be able to: 
- Recognize popular formal tools and describe their tradeoffs. 
- Describe the formal methods landscape.
- Explain core challenges in formal methods in software development and the trade-offs formal tools must make
- Utilize set theory and logic to perform proofs about fundamental mathematical sets such as the natural numbers.
- Utilize set theory and logic to perform proofs about fundamental data structures such as lists, trees, and graphs.



## Course 2: Approaches to Modeling & Verification
**Description**: This course introduces developers to important and widely used methods in formal tooling. It distinguishes between automated, semi-automated, and manual techniques and discusses properties to keep in mind when evaluating different techniques for different problems. It provides broad exposure to popular tools with the goal of developing a high level "map" of the territory.

Topics include:
- Types of analysis techniques
- Model checking
- Algorithms used as decision procedures in formal tools
- Relevance of Completeness and Soundness
- Fuzzing & Symbolic execution
- Abstract Interpretation
- Deductive Verification


**Outcomes**: Developers who complete this course will be able to:
- Understand the algorithms involved in automated, semi-automated, and manual formal techniques
- Utilize static analyzers to find bugs in code
- Use symbolic execution to verify programs
- Define a formal grammar and formal operational semantics for a simple programming language (using K Framework)
- Use K for modeling simple state transition systems



## Course 3: Formal Methods Fundamental Algorithms & Theory


**Description**: While the foundations course 1A laid the mathematical foundation and course 2 provided a tour of useful tools, this course dives deeper into fundamental algorithms involved in the tools we use for formal modeling, specification and verification.

Topics include:
- A tour of formal tools & methods

- SAT & SMT Solving
- Hoare logic
- Model checking theories & algorithms
- Introduction to rewrite & reachability logic
- Introduction to the K Framework


**Outcomes**: Developers who complete this course will be able to:
- Prove simple properties about programs using hoare logic
- Partially prove properties about programs with loops
- Understand how model checking and (semi)-automated theorem proving works
- Utilize SAT and SMT solvers to solve constraint satisfaction problems
- Compare and contrast different theories of logic 
- Define a formal semantics of a non trivial language and prove properties about that language using the K Framework
- Use higher level modeling to break a real-world cryptographic protocol


## Course 4: Applied Formal Methods

**Description**: This course builds upon the practical modeling skills in course 2 by applying formal specification and verification techniques to higher fidelity systems. Developers will construct various formal models of DeFi primitives subsystems within real DeFi protocols. This course also emphasizes formal methods workflows. This course marks a transition in the curriculum where we stop comparing and contrasting different tools and use the K framework in greater depth.

**Outcomes**: Developers who complete this course will be able to:
- Build non-trivial state transition models in K
- Formally specify non-trivial properties in K
- Review real-world applications of the K framework
- Read & build off of R&D from academia and industry to create something truly useful

# Getting started
Clone this repository: `git clone --recurse-submodules git@github.com:WilfredTA/formal-methods-curriculum.git`

This course also relies on Docker for running various formal tools. Please ensure that Docker is installed on your machine. Find installation & setup instructions [here](https://docs.docker.com/engine/install/).


## Organization
Courses in this curriculum are located in the [courses](/courses) subdirectory. There are multiple software-based formal tools that accompany the various courses in this curriculum. These are located in the top-level [tools](/tools) directory.
