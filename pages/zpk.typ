#import "../common.typ": *
#import fletcher: edge

= Monoid

A *monoid* is an object $M$ within a #pageLink("fye", title: [monoidal category]) with the morphisms

$
   mu & : M times.o M -> M & "multiplication" \
  eta & : I -> M           &           "unit"
$

such that

#diagram(
  cell-size: 15mm,
  $
    (M times.o M) times.o M
    edge("d", mu times.o 1, ->)
    edge("r", alpha, ->) & M times.o (M times.o M)
                           edge("r", 1 times.o mu, ->) & M times.o M
                                                         edge("d", mu, ->) \
     M times.o M
     edge("r,r", mu, ->) &                             &                 M
  $,
)

commutes given the identity morphism $1$.

Alternative interpretations of monoids:
- a semigroup with an identity element
- a magma (aka groupoid) with associativity and identity

Examples of monoids:
#table(
  columns: 3,
  table.header([*Category*], [*Operation*], [*Identity*]),
  [natural numbers], [addition], [0],
  [natural numbers], [multiplication], [1],
  [Boolean algebras], [$ and $], [$ tack.b $],
  [Boolean algebras], [$ or $], [$ tack.t $],
  [sets], [$ union $], [$ nothing $],
)
