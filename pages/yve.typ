#import "../common.typ": *

= The satisfiability problem

- Let $phi$ be a *propositional satisfiability instance*.
- Let $V(phi)$ be the *set of variables* in $phi$.
- Let $L(phi) = union.big_v^V(phi) {v, not v}$ be the *set of literals* in $phi$.
- Let $C(phi) subset.eq PP(L(phi))$ be the *set of clauses* in $phi$.

We attempt to find an *assignment*
$
               alpha : & V(phi) -> {tack.b, tack.t} \
  forall v in V(phi) : & alpha(not v) = not alpha(v)
$

that *satisfies* $phi$:
$
  alpha tack.r.double phi = and.big_c^C(phi) or.big_l^c alpha(l)
$

Then the *satisfiability problem* for $phi$ is:
$
  "SAT" = { phi | exists alpha : alpha tack.r.double phi}
$

In the domain of SAT solving, we also often think about *partial assignments*:
$
              D & subset.eq V(phi) \
            a_p & : D -> {tack.b, tack.t} \
  forall v in D & : alpha_p (not v) = not alpha_p (v)
$
