#import "../common.typ": *

= Fixpoint resolution

Defining a fixpoint ruleset for an instance $phi$ using
#pageLink("rag", title: [the resolution rule]) and first-order Horn clauses:
#let fixedRes = $Gamma^tack.b$
$
                      fixedRes(C) & <- C in phi \
  fixedRes(Gamma_1 union Gamma_2) & <-
                                    fixedRes(Gamma_1 union {ell}) and
                                    fixedRes(Gamma_2 union {not ell})
$

We can reframe this ruleset for non-empty clauses in terms of any literal $m in phi$:
$
  fixedRes(Gamma_1 union Gamma_2 union {m})
  & equiv (Gamma_1 union Gamma_2 union {m}) in phi \
  & or fixedRes(Gamma_1 union {ell}) and fixedRes(Gamma_2 union {ell} union {m}) \
  & or fixedRes(Gamma_1 union {ell} union {m}) and fixedRes(Gamma_2 union {ell})
$

and for the empty clause:
$
  fixedRes(emptyset) & equiv emptyset in phi \
                     & or fixedRes({ell}) and fixedRes({not ell})
$

Note that for the latter rule:
+ The empty clause rule is complete for SAT because it is equivalent to
  evaluating the Davis-Putnam satisfiability procedure.
+ Because the empty clause rule is equivalent to DP, it is exponential in memory.
+ Querying the satisfiability of the empty clause is unreachable by querying for
  a non-empty clause.

