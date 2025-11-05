#import "../common.typ": *

= Assignment power sets

Given some variables $a$, $b$, and $c$, the set of possible refuting clauses
for each partial assignment listed below is shown:
#let unsat = $cancel(angle: #20deg, tack.l.long)$
$
  C_1 & = &    {a} & unsat {not a}, emptyset \
  C_2 & = &    {b} & unsat {not b}, emptyset \
  C_3 & = & {b, c} & unsat {not b, not c}, {not b}, {not c}, emptyset \
$

In other words, for any partial assignment, the set of clauses that can prove
unsatisfiability of that partial assignment is the power set of that partial
assignment's negation. Therefore, any partial solution to a satisfiability
problem can be disproven by finding a clause that contains only a subset of its
negated literals.

Because #pageLink("wwa")[the fixpoint resolution predicate]
$|ell|^tack.b$ can find all clauses that are logical consequences of other
clauses, proving a partial assignment is satisfiable is equivalent to proving
that the power set of the negated assignment is disjoint with $|ell|^tack.b$.

We also have an inductive means of constructing complete power sets:
$
       PP(emptyset) & = emptyset \
  PP(C union {ell}) & = PP(C) union (PP(C) times {ell})
$
