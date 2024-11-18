#let accent_color = rgb("#8B4513")

#let styled_text(size, body, weight: "regular", style: "normal", fill: black, font: "Baskerville") = text(
  size: size,
  style: style,
  weight: weight,
  fill: fill,
  font: font,
)[#body]

#show heading: it => [
  #set align(center)
  #set text(font: "Baskerville", weight: "bold")
  #styled_text(1.2em, it.body, fill: accent_color)
]

#let minimalbc(
  name: "First and Last Name",
  role: none,
  phone: "+00 000 0000000",
  email: "me@me.com",
  website: "example.com",
  bg_color: rgb("#ffffff"),
  body
) = {
  set page(
    paper: "us-business-card",
    margin: (x: 18pt, y: 22pt),
    fill: bg_color,
  )
  set text(font: "Baskerville", size: 9pt)
  
  grid(
    columns: (1fr),
    rows: (auto, 1fr, auto),
    gutter: 12pt,
    align(center)[
      #stack(
        spacing: 8pt,
        styled_text(24pt, name, weight: "bold", font: "Baskerville"),
        if role != none { styled_text(14pt, role, style: "italic", fill: accent_color) },
      )
    ],
    align(center)[
      #stack(
        spacing: 7pt,
        styled_text(11pt, phone),
        styled_text(11pt, email),
        styled_text(11pt, website),
      )
    ],
    line(length: 100%, stroke: (paint: accent_color.lighten(40%), thickness: 0.75pt))
  )
}
