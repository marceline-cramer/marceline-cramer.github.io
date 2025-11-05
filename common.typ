#import "@preview/hyperscript:0.1.0": h
#import "@preview/fletcher:0.5.8"
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

#let palette = {
  paletteHex
    .pairs()
    .map(((key, val)) => (key, rgb(val)))
    .fold((:), (palette, (key, val)) => {
      palette.insert(key, val)
      palette
    })
}

#let pageLabels = state("common-page-labels", (:))

#let page(id) = context {
  let page = include "pages/" + id + ".typ"
  [#page #label(id)]
  pageLabels.update(labels => {
    labels.insert(id, label(id))
    labels
  })
}

#let site = context {
  html.elem("style", {
    "* {"
    for (key, val) in paletteHex {
      [#"--"#key: #val ;]
    }
    "}"

    read("style.css")
  })
}

#let note = h.with(".note")

#let pageLink(id, content) = context link(pageLabels.final().at(id), content)

#let diagram(..args) = h(".center-content", html.frame(fletcher.diagram(edge-stroke: palette.fg0, ..args)))

#let prooftree(..args) = h(".center-content", html.frame(curryst.prooftree(stroke: palette.fg0, ..args)))

