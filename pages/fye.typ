#import "../common.typ": *

= Monoidal Category

A *monoidal category* is a category $C$ with the morphisms

$
  times.o & : C times C -> C & "monoidal product" \
        I & : C              &  "identity object"
$

#note[The monoidal product is also known as the *tensor product*.]

and isomorphisms

$
  A_(A, B, C) & : A times.o (B times.o C) tilde.equiv (A times.o B) times.o C &   "associator" \
     lambda_A & : I times.o A tilde.equiv A                                   &  "left unitor" \
        rho_A & : A times.o I tilde.equiv A                                   & "right unitor"
$

#note[A mnemonic for the names of the unitors is _left_ for _lambda_ and _right_ for _rho_.]

This is just a fancy way of saying that the monoidal product is associative and
passes through values on either operand when the other operand is the identity object.
