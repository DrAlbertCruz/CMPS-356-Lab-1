# Lab 1: Backward Chaining and Tracing in Prolog

CMPS 3560 - Artificial Intelligence

Alberto C. Cruz, Ph.D.

Department of Computer and Electrical Engineering and Computer Science

## Prelab

Prelabs are short homework assignments that must be completed before the start of lab. Refer to the syllabus for procedures about how the prelabs are checked off. Consider the following rules:

* IF A AND B THEN L
* IF L AND B THEN M
* IF L AND M THEN P
* IF A AND P THEN L
* IF P THEN Q

1. Give a graph of the inference chain.
1. If A and B are fact, carry out backward chaining for the query: Q.

## Introduction

### Goals

* Know how to use the Prolog interpreter gprolog or swiprolog
*	Encode facts and rules in Prolog source code
*	Invoke queries to a Prolog inference engine
*	Trace a Prolog program to understand backward chaining

### Required Files

* example.pl in this repository

### Recommended Reading

* Prolog slides from Moodle
* http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/tracing.html 

### Background

Prolog is a declarative language first created in 1972 by Alain Colmerauer. A Prolog program consists of a set of statements called procedures. Statements are either a fact or a rule, similar to the description of rule-based expert systems in the text. Prolog it literally first order logic with a few exceptions. For this reason, Prolog lends itself well to implementing rule-based expert systems and will be our focus for the next three weeks. A user interacts with the Prolog interface, and the inference engine operates under the hood determining if the statement posited by the user is true or false. The only statements that are consulted, or executed, are statements that are goals or sub goals of the user’s statement. Thus, ordering of different rules in your source code does not effect when they are executed. However, multiple declarations of a rule with the same name must be grouped together, and rules with the same name are visited from top to bottom (more on that later). Each statement contains one or more clauses within the procedure which are ordered. The Prolog IDE we will use in class is gprolog , which is already on sleipnir. You can bring up gprolog by executing `gprolog` while in the server.

When you want to quit prolog execute the following command: `halt.`. Note the period. The period terminates a gprolog procedure. Your code must be entered in a text file separately and then loaded while running gprolog using the following command: `?- consult( 'example.pl' ).`, which will load factorial.pl into gprolog.

### Facts

Open up vi, emacs, nano etc. and take a look at `example.pl`. As stated previously, you must write your code in a source file and then execute it later while running gprolog. Prolog code contains facts and rules. The following syntax is used to enter facts, also known as axioms and assertions:

> car(gray).

This statement enters the fact ‘car’ is ‘gray.’ The following fact has multiple clauses: 

> color(a, orange).

This statement would be read as some object ‘a’ has the ‘color’ ‘orange.’ By convention, we will place the operator after the first clause. There are a few more facts. Try to understand them before moving on.

### Rules

Rules are encoded with the consequent first, followed by the operator `:-`, then the clauses of the antecedent separated by commas. For example:

> hamburger(X) :- color(X,tan), shape(X,round).

> full(X) :- ate(X, hamburger).
  
The first rule is interpreted as: If the 'color' of some object 'X' is 'tan' and it's 'shape' is 'round', then 'X' is a hamburger. The second rule is read as, if 'X' ate a 'hamburger' specifically, then 'X' is full. Invoking `full(X).` during runtime will check for all objects in the database that ate a hamburger. If you invoke full(jill) it will check if jill ate a hamburger. This is how you will implement queries in Prolog.

### Queries

When you are done looking at example.pl, quit your text editor and then run gprolog and consult your source code (see above for the command to do this). To check if a rule has been proven (e.g. it has fired/it is true/it is in the database) invoke the following command:

> | ?- orange(a).

> true.

which attempts to prove that ‘a’ is a 'orange’ according to the rule established in example.pl. Since ‘color’ is ‘red’ is fact, the rule `fruit(apple) :- color(red).` will always be true. This is an example of a ground query. To check if an object is full: 

> | ?- hamburger(a).

> false.

We know for a fact that ‘a’ is an ‘orange’, so it can’t be true according to our rule. A non-ground query is a query invocation with a variable in it. Recall that variables start with an uppercase letter. 
