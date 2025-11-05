#import "../common.typ": *

= Resolution

Given some variable $ell$:
#prooftree(curryst.rule(
  name: $|ell|$,
  $Gamma_1 union Gamma_2$,
  $Gamma_1 union { ell }$,
  $Gamma_2 union { not ell }$,
))

Also note that due to the law of the excluded middle, resolution on two or
more opposing variable assignments is a tautology:
#prooftree(curryst.rule(
  $tack.b$,
  curryst.rule(
    $Gamma_1 union Gamma_2 union tack.b$,
    curryst.rule(
      name: $|ell|$,
      $Gamma_1 union Gamma_2 union {m, not m}$,
      $Gamma_1 union { ell, m }$,
      $Gamma_2 union { not ell, not m }$,
    ),
  ),
))

The resolution rule itself is monotonic: every clause inferred through
resolution is merely _implied_ by the two clauses it's constructed from.
Therefore, assuming no means of eliminating subsumed clauses, the resolution
rule as a means of inferring new clauses is valid if resolved clauses are
directly added back to the set of known clauses.

