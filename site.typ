#import "@preview/hyperscript:0.1.0": h

#html.elem("style", read("style.css"))

#let section(title, ..content) = {
  html.elem("table", html.elem("tr", [
    #html.elem("td", html.elem("p", attrs: (class: ".section-heading"), title))
    #html.elem("td", box(..content))
  ]))
}

#section([Hi.], [
  I'm Mars. I write a lot of code and I like to think I'm good at math.

  It highly annoys me when people write "alot" instead of "a lot," "too" when they mean
  "to," or "loose" when they mean "lose."

  I really like #link("https://www.brailleinstitute.org/freefont/", [Atkinson Hyperlegible]).
  Please consider using it!
])

