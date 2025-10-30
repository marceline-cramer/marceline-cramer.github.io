#import "@preview/hyperscript:0.1.0": h

#html.elem("style", read("style.css"))

#show heading: c => h(".heading", c)
#show math.equation: html.frame
#show math.equation.where(block: true): h.with(".center-content")

= Hi.

I'm Mars. I write a lot of code and I like to think I'm good at math.

I like minimalism. Can you tell?

I really like #link("https://www.brailleinstitute.org/freefont/", [Atkinson Hyperlegible]).
Please consider using it!

My favorite color scheme is #link("https://github.com/sainnhe/gruvbox-material", [Gruvbox Material]).
It's what this site is themed with... assuming you're not messing with the CSS.

Some Typst math:

$ overline(A B) = overline(A) + overline(B) $

It highly annoys me when people write "alot" instead of "a lot," "too" when they mean
"to," or "loose" when they mean "lose."

= Site to-do list:

- bundle Atkinson Hyperlegible in static files
- add a basic personal directory (Discord, GitHub, LinkedIn)
- add a new Typst-based resume
- add an icon (ringed planet emoji is fine)
- support #link("https://ogp.me", [Open Graph]) for pretty link embeds
- disable Dark Reader in dark mode
