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
    margin: (x: 0.2in, y: 0.2in),
    fill: rgb("ffffff")
  )
  
  // Using Didot for ultra-dramatic serif typography
  set text(font: "Didot")
  set align(center)

  // Container for vertical alignment
  block(width: 100%, height: 100%, {
    // Background massive name
    place(
      center + horizon,
      block(width: 100%, {
        set text(
          size: 3.8em,
          fill: rgb("#00000008"),
          tracking: 0.1em,
          weight: "regular"
        )
        stack(
          spacing: -0.15em,
          ..name.split(" ").map(part => upper(part))
        )
      })
    )
    
    // Foreground content
    align(center + horizon, {
      // Smaller foreground name
      set text(tracking: 0.2em)
      set text(size: 1.4em, weight: "regular")
      block(spacing: 0.5em, {
        let name-parts = name.split(" ")
        stack(
          spacing: 0.15em,
          ..name-parts.map(part => upper(part))
        )
      })
      
      // Thin elegant separator
      v(0.2em)
      line(length: 25%, stroke: (paint: rgb("#000000"), thickness: 0.02em))
      v(0.3em)
      
      // Contact details with refined typography
      set text(font: "Didot", size: 0.6em, tracking: 0.08em)
      stack(
        spacing: 0.7em,
        {
          set text(fill: rgb("#000000"), weight: "regular")
          link("mailto:" + email)[#email]
        },
        {
          set text(fill: rgb("#000000"), weight: "regular")
          link("tel:" + phone)[#phone]
        }
      )
    })
  })
} 