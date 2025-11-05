#import "@preview/hyperscript:0.1.0": h
#import "@preview/swank-tex:0.1.0": *
#import "common.typ": note, page, palette, site

#set text(fill: palette.fg0)
#set heading(numbering: "1a")
#show heading: h.with(".heading")
#show html.frame: box
#show math.equation: html.frame
#show math.equation.where(block: true): h.with(".center-content")

= Hi.

I'm Mars. I write a lot of code and I like to think I'm good at math.

I like minimalism. Can you tell?

I really like #link("https://www.brailleinstitute.org/freefont/", [Atkinson Hyperlegible]).
Please consider using it!

My favorite color scheme is #link("https://github.com/sainnhe/gruvbox-material", [Gruvbox Material]).
It's what this site is themed with... assuming you're not messing with the CSS.

It highly annoys me when people write "alot" instead of "a lot," "too" when they mean
"to," or "loose" when they mean "lose."

= Website to-do

- bundle Atkinson Hyperlegible in static files
- add a basic personal directory (Discord, GitHub, LinkedIn)
- add a new Typst-based resume
- render more than just the index page
- make headings links to themselves
- add custom `<head>` contents, then...
  - support #link("https://ogp.me", [Open Graph]) for pretty link embeds
  - disable Dark Reader in dark mode
  - add a favicon (ringed planet emoji is fine)

#page("eeg")
#page("fye")
#page("kpy")
#page("qnk")
#page("rag")
#page("wrf")
#page("wwa")
#page("yus")
#page("yve")
#page("zpk")

#site
