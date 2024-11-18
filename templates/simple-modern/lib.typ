#let business-card(
  name: "Name",
  email: "email@example.com",
  phone: "000 000 0000",
) = {
  // Document settings
  set document(title: "Business Card")
  set page(
    width: 3.5in,
    height: 2in,
    margin: (x: 0.5in, y: 0.4in),
    fill: rgb("ffffff")
  )
  
  set text(font: "Helvetica")
  set align(center)

  // Container for vertical alignment
  block(width: 100%, height: 90%, {
    align(center + horizon, {
      set text(tracking: 0.1em)
      set text(size: 1.2em, weight: "medium")
      upper(name)
      
      line(length: 50%, stroke: 0.05em)
      
      set text(size: 0.6em, tracking: 0em)
      stack(
        spacing: 0.7em,
        link("mailto:" + email)[#text(fill: rgb("#333333"))[#email]],
        link("tel:" + phone)[#text(fill: rgb("#333333"))[#phone]]
      )
    })
  })
} 