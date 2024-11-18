#let default_colors = (
  primary: rgb("#0077be"),
  background: rgb("#ffffff"),
  text: rgb("#333333")
)

#let styled_text(
  content,
  size: 9pt,
  weight: "regular",
  style: "normal",
  color: default_colors.text
) = text(
  size: size,
  style: style,
  weight: weight,
  fill: color,
  content
)

#let contact_row(icon, content, color: default_colors.text) = {
  box(
    height: 11pt,
    grid(
      columns: (auto, 1fr),
      gutter: 5pt,
      align(center + horizon, text(fill: color, icon)),
      align(left + horizon, styled_text(content, color: color))
    )
  )
}

#let business_card(
  name: "First Last",
  role: none,
  contact: (
    phone: none,
    email: none,
    website: none
  ),
  colors: default_colors,
  format: (
    size: "us",
    flip: false
  ),
  body
) = {
  // Set up page format
  set page(
    paper: format.size + "-business-card",
    flipped: format.flip,
    margin: (x: 15pt, y: 20pt),
    background: rect(width: 100%, height: 100%, fill: colors.background)
  )
  
  set text(font: "Helvetica", size: 9pt)
  
  // Main layout
  grid(
    columns: (1fr, auto),
    gutter: 15pt,
    
    // Left side - Contact information
    align(left + horizon)[
      #stack(
        spacing: 8pt,
        
        // Name and role
        styled_text(name, size: 18pt, weight: "bold"),
        if role != none { 
          styled_text(
            role,
            size: 11pt,
            style: "italic",
            color: colors.primary
          )
        },
        
        // Separator line
        line(
          length: 100%,
          stroke: (
            thickness: 0.7pt,
            paint: colors.primary
          )
        ),
        
        // Contact details with icons
        if contact.phone != none {
          contact_row("📱", contact.phone)
        },
        if contact.email != none {
          contact_row("✉", contact.email)
        },
        if contact.website != none {
          contact_row("🌐", contact.website)
        }
      )
    ],
    
    // Right side - Circle with initials
    align(right + horizon)[
      #box(
        width: 55pt,
        height: 55pt,
        radius: 27.5pt,
        fill: colors.primary.lighten(85%),
        stroke: (
          thickness: 1.5pt,
          paint: colors.primary
        ),
        align(center + horizon)[
          #styled_text(
            name.split(" ")
              .map(word => word.at(0))
              .join(),
            size: 26pt,
            weight: "bold",
            color: colors.primary
          )
        ]
      )
    ]
  )
}
