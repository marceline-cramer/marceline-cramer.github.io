#import "../common.typ": *

= The satisfiability problem

The *Boolean satisfiability problem* is a fundamental problem in computer science, logic, and artificial intelligence. For a *satisfiability instance*, it asks whether there exists an assignment of truth values to the Boolean variables in the instance such that all propositional constraints in the instance are met.

== Overview

I express satisfiability instances with the opaque identifier $phi$.

Every satisfiability instance $phi$ has a set of variables $V(phi)$,
which represent the unique propositional variables in the instance.

We support the usual Boolean operators $and$, $or$, and $not$ for variables.
An important rule is the law of double negation:
$ forall v in V(phi) : not not v = v $

We can express the sets of *positive and negative literals* for $phi$:
$
  L^+(phi) & = V(phi) \
  L^-(phi) & = { ell in V(phi) | not ell }
$

Then combine them to obtain the total set of unique literals $L(phi)$:
$ L(phi) = L^+(phi) union L^-(phi) $

So far, we've expressed the domain of propositional satisfiability instances,
but not their constraining *clauses* $C(phi)$:
$ C(phi) subset.eq PP(L(phi)) $

Each clause represents a disjunction of literals. The set of clauses $C(phi)$
represents the *conjunctive normal form* (CNF) of the constraints.
Notably, _all_ Boolean expressions can be expressed as CNF clauses using
techniques such as the Tseitin transformation or repeat application of
De Morgan's laws.

#note[Conjunctive normal form is also known as *sum of products* (SOP).]

To solve the satisfiability problem for our instance $phi$, we attempt to find an *assignment* $alpha$.
$
               alpha : & V(phi) -> {tack.b, tack.t} \
  forall v in V(phi) : & alpha(not v) = not alpha(v)
$

An assignment $alpha$ *satisfies* a clause $c in C(phi)$ if:
$ alpha tack.r.double c equiv or.big_l^c alpha(l) $

And the assignment $alpha$ *satisfies* $phi$ if:
$ alpha tack.r.double phi equiv and.big_c^C(phi) alpha tack.r.double c $

Summing up, the full *satisfiability problem* for $phi$ is:
$ "SAT"(phi) = exists alpha : alpha tack.r.double phi $

== Clauses as "at least one"

Because all clauses in a satisfiability instance are disjunctions of literals,
one way of conceptualizing a clause is as an "at least one" constraint.
$
  alpha tack.r.double c & equiv or.big_c^C(phi) alpha tack.r.double c \
                        & equiv exists ell in c : alpha(ell) \
                        & equiv |{ell in c | alpha(ell) }| >= 1
$

== Partial assignments

In the domain of SAT solving, we also often think about *partial assignments*:
$
              D & subset.eq V(phi) \
        alpha_p & : D -> {tack.b, tack.t} \
  forall v in D & : alpha_p (not v) = not alpha_p (v)
$

== Tautologies

For any clause $c in C(phi)$, we say that $c$ is a *tautology* if:
$ "Taut"(c) = exists ell in c: not ell in c $

Because tautologies are always satisfiable and yield no information
about the satisfiability of an instance, we typically omit tautologies
from problems.

== Clause negation

A notational trick I use is to negate every literal in a clause using the $not$ operator.
$ forall c in C(phi) : not c = { not ell | ell in c } $
