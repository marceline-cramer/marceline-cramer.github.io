#import "../common.typ": *
#import fletcher: edge, node

= Algebra Cube

#diagram(
  spacing: (1cm, 2cm),
  edge-stroke: 1pt,
  crossing-thickness: 5,
  mark-scale: 70%,
  node-outset: 2pt,
  node((0, 0), "magma"),

  node((-1, 1), "semigroup"),
  node((0, 1), "unital magma"),
  node((+1, 1), "quasigroup"),

  node((-1, 2), "monoid"),
  node((0, 2), "inverse semigroup"),
  node((+1, 2), "loop"),

  node((0, 3), "group"),

  {
    let quad(a, b, label, paint, ..args) = {
      edge(
        a,
        b,
        text(paint, label),
        "-|>",
        stroke: paint,
        label-side: center,
        label-fill: palette.bg0,
        crossing-fill: palette.bg0,
        ..args,
      )
    }

    quad((0, 0), (-1, 1), "Assoc", palette.blue)
    quad((0, 1), (-1, 2), "Assoc", palette.blue, label-pos: 0.3)
    quad((1, 2), (0, 3), "Assoc", palette.blue)

    quad((0, 0), (0, 1), "Id", palette.red)
    quad((-1, 1), (-1, 2), "Id", palette.red, label-pos: 0.3)
    quad((+1, 1), (+1, 2), "Id", palette.red, label-pos: 0.3)
    quad((0, 2), (0, 3), "Id", palette.red)

    quad((0, 0), (1, 1), "Div", palette.yellow)
    quad((-1, 1), (0, 2), "Div", palette.yellow, label-pos: 0.3, "crossing")

    quad((-1, 2), (0, 3), "Inv", palette.green)
    quad((0, 1), (+1, 2), "Inv", palette.green, label-pos: 0.3)

    quad((1, 1), (0, 2), "Assoc", palette.blue, label-pos: 0.3, "crossing")
  },
)
