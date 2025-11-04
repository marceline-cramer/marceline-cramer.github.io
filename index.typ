#import "@preview/hyperscript:0.1.0": h
#import "@preview/fletcher:0.5.8": node, edge, diagram as baseDiagram
#import "@preview/swank-tex:0.1.0": *
#import "@preview/curryst:0.5.1"

// Gruvbox Material dark hard
// TODO: find way to recolor SVGs
#let paletteHex = (
  bg0: "#1d2021",
  fg0: "#d4be98",
  grey0: "#7c6f64",
  grey1: "#928374",
  red: "#ea6962",
  green: "#a9b665",
  blue: "#7daea3",
  yellow: "#d8a657",
  purple: "#d3869b",
  orange: "#e78a43",
  aqua: "#89b482",
)

#html.elem("style", {
  "* {";
  for (key, val) in paletteHex {
    [#"--"#key: #val ;];
  }
  "}";

  read("style.css");
})

#let palette = {
  paletteHex
  .pairs()
  .map(((key, val)) => (key, rgb(val)))
  .fold((:), (palette, (key, val)) => {palette.insert(key, val); palette})
}

#set text(fill: palette.fg0)
#set heading(numbering: "1a")
#show heading: h.with(".heading")
#show html.frame: box
#show math.equation: html.frame
#show math.equation.where(block: true): h.with(".center-content")

#let diagram(..args) = h(".center-content", html.frame(baseDiagram(edge-stroke: palette.fg0, ..args)))

#let prooftree(..args) = h(".center-content", html.frame(curryst.prooftree(stroke: palette.fg0, ..args)))

#let note = h.with(".note")

= Hi.

I'm Mars. I write a lot of code and I like to think I'm good at math.

I like minimalism. Can you tell?

I really like #link("https://www.brailleinstitute.org/freefont/", [Atkinson Hyperlegible]).
Please consider using it!

My favorite color scheme is #link("https://github.com/sainnhe/gruvbox-material", [Gruvbox Material]).
It's what this site is themed with... assuming you're not messing with the CSS.

It highly annoys me when people write "alot" instead of "a lot," "too" when they mean
"to," or "loose" when they mean "lose."

= About the site

Soon, I'm going to be putting school on hold to focus on work, and I figure
that now is a good time to take advantage of the fact that I am a highly skilled
self-teacher. I've dreamt for a long time of maintaining some static knowledge
bank; some place where I can contribute new information to and trust the contents
to stay highly-curated and reproducible. In theory, Obsidian does that, but in
practice, I love to show off my interests. I want to have more to show for my
mad scientist persona than a bunch of half-baked coding projects (not as a
matter of self-esteem but as a matter of vanity).

I also realized last weekend that I'm actually an extrovert. Yes, the dichotomy
between extrovert and introvert is shaky at best, but the bottom line is that
I'm much more comfortable being around people than I thought before. Maybe I
should start leaning into that and giving myself an environment where
socializing around my interests comes naturally... like a public knowledge bank?

I made this website using #link("https://typst.app", [Typst]). Support for HTML
in Typst is still pretty young and I'm having to invent a lot from scratch to
use it as a static site generator. However, I truly believe it pays off. Typst
is more than a typesetting environment---it's an entire programming language. I'm
hoping that Typst can support exponentially more reflection and data surfacing
than Obsidian with plugins. As a programming language instead of an existing
static site generation framework, it's also an environment I have complete
control of and can suit to my needs perfectly. The math and diagram functionality
is also _gorgeous_ and I vastly prefer Typst's solutions to solving problems
over how #html.frame(LaTeX) accomplishes the same tasks.

I see this website as serving as a professional profile of me, my knowledge, and
my interests, but I have no intentions of targeting an audience with this site
other than myself. This is a _knowledge_ bank.

I am a computer scientist before anything else but I have other interests that
I want to archive on this site too. Among my major interests are linguistics,
history, politics, philosophy, architecture, and music. One of the best reasons
to maintain a _personal_ knowledge bank is that my personal
#link(<rhizomatic-thinking>)[rhizomatic] links between different broad concepts
can be expressed by me through the site's organization without regard for a
broad audience. This should mean I can provide a more concrete foundation for
my typically very abstract means of coming up with ideas and span lots of
different fields with the same concepts.

== Site to-do list:

- bundle Atkinson Hyperlegible in static files
- add a basic personal directory (Discord, GitHub, LinkedIn)
- add a new Typst-based resume
- render more than just the index page
- make headings links to themselves
- add custom `<head>` contents, then...
  - support #link("https://ogp.me", [Open Graph]) for pretty link embeds
  - disable Dark Reader in dark mode
  - add a favicon (ringed planet emoji is fine)

= Unorganized math

I'd like to split up this website into more pages and turn it into a personal
knowledge base. However, that's really difficult. In the meantime, I can scrawl
down some math thoughts and play with Typst rendering.

== Monad

A *monad* is a #link(<monoid>, [monoid]) in the category of #link(<endofunctor>, [endofunctors]).

== Monoid <monoid>

A *monoid* is an object $M$ within a #link(<monoidal-category>, [monoidal category])
with the morphisms

$
  mu &: M times.o M -> M & "multiplication" \
  eta &: I -> M & "unit"
$

such that

#diagram(cell-size: 15mm, $
  (M times.o M) times.o M
    edge("d", mu times.o 1, ->)
    edge("r", alpha, ->)
  & M times.o (M times.o M)
    edge("r", 1 times.o mu, ->)
  & M times.o M
    edge("d", mu, ->)
  \ M times.o M
    edge("r,r", mu, ->)
  && M
$)

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

== Monoidal Category <monoidal-category>

A *monoidal category* is a category $C$ with the morphisms

$
  times.o &: C times C -> C & "monoidal product" \
  I &: C & "identity object"
$

#note[The monoidal product is also known as the *tensor product*.]

and isomorphisms

$
  A_(A, B, C) &: A times.o (B times.o C) tilde.equiv (A times.o B) times.o C & "associator" \
  lambda_A &: I times.o A tilde.equiv A & "left unitor" \
  rho_A &: A times.o I tilde.equiv A & "right unitor"
$

#note[A mnemonic for the names of the unitors is _left_ for _lambda_ and _right_ for _rho_.]

This is just a fancy way of saying that the monoidal product is associative and
passes through values on either operand when the other operand is the identity object.

== Endofunctor <endofunctor>

An *endofunctor* is just a functor from a category to itself.

Given a category $C$, an endofunctor $f$ can be defined as $f : C -> C$.

As in: "Endofunctor? I hardly know her!"

== Algebra Cube

#diagram(
  spacing: (1cm, 2cm),
  edge-stroke: 1pt,
  crossing-thickness: 5,
  mark-scale: 70%,
  node-outset: 2pt,
  node((0,0), "magma"),

  node((-1,1), "semigroup"),
  node(( 0,1), "unital magma"),
  node((+1,1), "quasigroup"),

  node((-1,2), "monoid"),
  node(( 0,2), "inverse semigroup"),
  node((+1,2), "loop"),

  node(( 0,3), "group"),

  {
    let quad(a, b, label, paint, ..args) = {
      edge(
        a, b,
        text(paint, label), "-|>",
        stroke: paint, label-side: center,
        label-fill: palette.bg0, crossing-fill: palette.bg0,
        ..args
      )
    }

    quad((0,0), (-1,1), "Assoc", palette.blue)
    quad((0,1), (-1,2), "Assoc", palette.blue, label-pos: 0.3)
    quad((1,2), (0,3), "Assoc", palette.blue)

    quad((0,0), (0,1), "Id", palette.red)
    quad((-1,1), (-1,2), "Id", palette.red, label-pos: 0.3)
    quad((+1,1), (+1,2), "Id", palette.red, label-pos: 0.3)
    quad((0,2), (0,3), "Id", palette.red)

    quad((0,0), (1,1), "Div", palette.yellow)
    quad((-1,1), (0,2), "Div", palette.yellow, label-pos: 0.3, "crossing")

    quad((-1,2), (0,3), "Inv", palette.green)
    quad((0,1), (+1,2), "Inv", palette.green, label-pos: 0.3)

    quad((1,1), (0,2), "Assoc", palette.blue, label-pos: 0.3, "crossing")
  },
)

= Satisfiability

I really like #link("https://en.wikipedia.org/wiki/Boolean_satisfiability_problem")[SAT solving].

== Parallel SAT? Maybe?

First, let's suppose #link(<assignment-power-sets>)[power sets of partial
assignments] as the deciding factor for satisfiability.

DPLL and CDCL utilize procedures to disprove partial assignments based on these
power sets. This is the logical precedence for their backtracking. The procedure
to decide satisfiability for any partial assignment or ancestral line along any
node of the search tree is to prove that its search subtree is unsatisfiable.
Of course, _those_ children can only be found unsatisfiable if for every child
node's partial assignment, there exists a clause that refutes it.

DPLL will naively traverse all partial assignments based only on refutations
from the initial set of clauses. This does not synthesize any new clauses using
resolution while remaining a complete search. From a power sets perspective,
this is because the power sets of total assignments contain all of the clauses
in the base SAT instance.

CDCL will use the resolution rule to construct new clauses as they are
encountered. However, because of the recursive nature of these decision
procedures, this discovery of refutation does not lend itself to
parallelization. Until a conflict that is only resolved by application of the
resolution rule is reached, partial assignments may be formed along the depth
of the search tree that may be proved unsatisfiable by a small number of
queries into the fixpoint resolution predicate.

Cube and conquer (C&C) is effective at leveraging multiple processors to solve
a single SAT problem. However, because each cube is solved via DPLL or CDCL,
reducing a SAT problem to cubes still introduces implicit redundancy in
computation.

We now have some lemmas for constructing a parallel SAT solver:
+ The #link(<fp-resolution>)[fixpoint resolution predicate] is decidable,
  finite, and complete for deciding reachability of a clause via resolution.
+ The #link(<assignment-power-sets>)[power set of a negated partial assignment]
  must be disjoint from the set of found clauses.

== Redundancy in DPLL <dpll-redundancy>

I would argue that there is redundant computation in DPLL.

Depth-first traversal of the search tree extends existing partial assignments.
If the principal mode of evaluating the unsatisfiability of partial assignments
does not consider #link(<resolution>)[resolution] then this cannot be
considered to duplicate work.

For a unit partial assignment $rho = {m}$, the
#link(<assignment-power-sets>)[set of refuting clauses] is ${{not m},
emptyset}$.


We have a split rule for variables $ell$ which can resolve to the empty clause:
$
  Gamma'(ell) & = Gamma({not ell}) and Gamma({ell})
$

Deciding if the empty clause $emptyset$ can be inferred via resolution is exponential in memory:
#let fixedRes = math.Gamma // $|ell|^tack.b$
$
  fixedRes(emptyset) & = (emptyset in C(phi)) or or.big_ell^(V(phi)) Gamma'(ell) \
$

== Assignment power sets <assignment-power-sets>

Given some variables $a$, $b$, and $c$, the set of possible refuting clauses
for each partial assignment listed below is shown:
#let unsat = $cancel(angle: #20deg, tack.l.long)$
$
  C_1 &=& {a}    &unsat {not a}, emptyset \
  C_2 &=& {b}    &unsat {not b}, emptyset \
  C_3 &=& {b, c} &unsat {not b, not c}, {not b}, {not c}, emptyset \
$

In other words, for any partial assignment, the set of clauses that can prove
unsatisfiability of that partial assignment is the power set of that partial
assignment's negation. Therefore, any partial solution to a satisfiability
problem can be disproven by finding a clause that contains only a subset of its
negated literals.

Because #link(<fp-resolution>)[the fixpoint resolution predicate]
$|ell|^tack.b$ can find all clauses that are logical consequences of other
clauses, proving a partial assignment is satisfiable is equivalent to proving
that the power set of the negated assignment is disjoint with $|ell|^tack.b$.

We also have an inductive means of constructing complete power sets:
$
  PP(emptyset) &= emptyset \
  PP(C union {ell}) &= PP(C) union (PP(C) times {ell})
$

== Fixpoint resolution <fp-resolution>

Defining a fixpoint ruleset for an instance $phi$ using
#link(<resolution>)[the resolution rule] and first-order Horn clauses:
#let fixedRes = $|ell|^tack.b$
$
  fixedRes(C) &<- C in phi \
  fixedRes(Gamma_1 union Gamma_2) &<-
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
  fixedRes(emptyset)
    & equiv emptyset in phi \
    & or fixedRes({ell}) and fixedRes({not ell})
$

Note that for the latter rule:
+ The empty clause rule is complete for SAT because it is equivalent to
  evaluating the Davis-Putnam satisfiability procedure.
+ Because the empty clause rule is equivalent to DP, it is exponential in memory.
+ Querying the satisfiability of the empty clause is unreachable by querying for
  a non-empty clause.

== Resolution <resolution>

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
))))

The resolution rule itself is monotonic: every clause inferred through
resolution is merely _implied_ by the two clauses it's constructed from.
Therefore, assuming no means of eliminating subsumed clauses, the resolution
rule as a means of inferring new clauses is valid if resolved clauses are
directly added back to the set of known clauses.

== The satisfiability problem <sat-problem>

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

= Rhizomatic thinking <rhizomatic-thinking>

*Rhizomatic thought* is thinking that sporadically networks different ideas
orthogonally to conceptual hierarchies (aka *arborescent thought*).

#note[There's more to the concept but I'm doing other things at time of writing.
Read #link("https://en.wikipedia.org/wiki/Rhizomatic_learning")[the Wikipedia page]
for more info.]

#table(
  columns: 2,
  table.header([*Rhizomatic*], [*Arborescent*]),
  [entity-component-system (ECS)], [object-oriented programming],
  [tagged filesystems], [directory hierarchies],
  [Zettelkasten], [Johnny Decimal],
  [relational databases], [document stores],
)
