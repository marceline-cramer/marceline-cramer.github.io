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

#let pageInfo = state("common-page-info", (:))
#let links = state("common-links")
#let title = state("common-title")

#let showBacklinks(dst) = context {
  let backlinks = ()
  for (src, info) in pageInfo.final() {
    if info.links == none {
      continue
    }

    for link in info.links {
      if link == dst {
        backlinks.push(info)
      }
    }
  }

  if backlinks == () {
    return
  }

  heading(depth: 2, [Backlinks])

  for backlink in backlinks {
    list(link(backlink.label, backlink.title))
  }
}

#let page(id) = {
  links.update(())
  title.update([\<no title\>])

  [
    #include "pages/" + id + ".typ"
    #label(id)
  ]

  showBacklinks(id)

  context {
    let info = (
      id: id,
      label: label(id),
      links: links.get(),
      title: title.get(),
    )

    pageInfo.update(labels => {
      labels.insert(id, info)
      labels
    })
  }
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

#let pageLink(id, title: none) = {
  links.update(tail => (id, ..tail))
  context {
    let info = pageInfo.final().at(id)
    if title == none {
      link(info.label, info.title)
    } else {
      link(info.label, title)
    }
  }
}

#let diagram(..args) = h(".center-content", html.frame(fletcher.diagram(edge-stroke: palette.fg0, ..args)))

#let prooftree(..args) = h(".center-content", html.frame(curryst.prooftree(stroke: palette.fg0, ..args)))
