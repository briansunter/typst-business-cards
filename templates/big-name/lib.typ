#let business-card(
  name: "Name",
  email: "email@example.com",
) = {
  // Document settings
  set document(title: "Business Card")
  set page(
    width: 3.5in,
    height: 2in,
    margin: (x: 0.35in, y: 0.25in),
    fill: rgb("ffffff")
  )
  
  set text(font: "Helvetica")
  
  block(width: 100%, height: 100%, {
    stack(
      spacing: 0.7fr,  
      
      align(left + top, {
        set text(size: 2.5em, weight: "bold" )
        let names = name.split(" ")
        stack(
          spacing: 0.1em,
          ..names.map(n => [#n])
        )
      }),
      
      align(right, {
        set text(size: 0.7em, weight: "regular")
        link("mailto:" + email)[#text(fill: rgb("#666666"))[#email]]
      })
    )
  })
} 