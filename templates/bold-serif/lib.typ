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
    margin: (x: 0.15in, y: 0.15in),
    fill: rgb("ffffff")
  )
  
  // Using Didot for dramatic serif typography
  set text(font: "Didot")
  set align(center)

  // Container for vertical alignment
  block(width: 100%, height: 100%, {
    // Name centered vertically and horizontally
    align(center + horizon, {
      // Massive name with refined spacing
      set text(tracking: 0.02em)  // Increased letter spacing
      set text(size: 2.5em, weight: "extrabold")
      block(spacing: 1.0em, {
        let name_parts = name.split(" ")
        stack(
          spacing: 0.2em,  // Increased spacing between name parts
          upper(name_parts.at(0)),  // First name
          {
            set text(size: 0.9em)  // Slightly smaller size for last name
            upper(name_parts.slice(1).join(" "))  // Rest of name
          }
        )
      })
    })
    
    // Contact details at bottom
    align(center + bottom, {
      set text(font: "Didot", size: 0.55em, tracking: 0.12em)  // Smaller size, wider tracking
      {
        set text(fill: rgb("#333333"), weight: "regular")  // Lighter text color
        link("mailto:" + email)[#email] 
        h(1.4em)  // More space between email and phone
        link("tel:" + phone)[#phone]
      }
    })
  })
} 