#let business-card(
  // Card style
  bg_color: "ffffff",
  text_color: black,
  font: "Garamond Classico SC",
  base_size: 9pt,
  
  // Company info
  company_name: "Pierce & Pierce",
  company_division: "Mergers and Acquisitions",
  
  // Personal info
  name: "Patrick Bateman",
  title: "Vice President",
  
  // Contact info
  phone: "212 555 6342",
  fax: "212 555 6390",
  telex: "10 4534",
  
  // Address
  street: "358 Exchange Place",
  city: "New York",
  state: "N.Y.",
  zip: "10099",
) = {
  // Page setup
  set page(
    width: 85mm,
    height: 55mm,
    margin: (x: 5mm, y: 5mm)
  )

  // Base text settings
  set text(
    font: font,
    size: base_size,
    fill: text_color,
    tracking: 0.5pt
  )

  // Top section
  grid(
    columns: (1fr, 1fr),
    gutter: 0pt,
    
    align(left + top, {
      v(1pt)
      box({
        text(size: 9.0pt, phone.slice(0,3), tracking: -0.2pt)
        h(0.5pt)
        box(move(dy: 0.0pt, text(size: 8.5pt, phone.slice(4,7), tracking: -0.2pt)))
        h(1.0pt) 
        box(move(dy: -0.0pt, text(size: 9.0pt, phone.slice(8), tracking: -0.1pt)))
      })
    }),
    
    align(right, {
      text(size: 9.5pt, tracking: -0.0pt, company_name)
      linebreak()
      v(-10pt)
      text(size: 6.0pt, tracking: -0.11pt, company_division)
    })
  )
  
  // Adjusted vertical spacing
  v(22pt)
  
  // Center section with name and title
  align(center, {
    box({
      let names = name.split(" ")
      text(size: 10.0pt, tracking: 0.0pt, names.at(0) + " ") // First name normal
      text(size: 10pt, tracking: 0.6pt, upper(names.at(1))) // Last name uppercase
    })
    v(-6.5pt)
    text(size: 8.5pt, tracking: 0.4pt, title)
  })
  
  // Push address section to bottom
  v(1fr)
  
  // Bottom section with address
  align(center, {
    text(
      size: 5.5pt,
      tracking: 0.0pt,
      {
        text(size: 7.0pt, street + ", " + city + ", " + state + " " + zip + " ")
      }
    )
    text(
      size: 6.0pt,
      tracking: 0.0pt,
      "FAX " + fax + " TELEX " + telex
    )
  })
  v(2pt)
} 