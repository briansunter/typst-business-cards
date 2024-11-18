#import "lib.typ": * 

#show: business_card.with(
  name: "Brian Sunter",
  role: "Software Engineer",
  contact: (
    phone: "914-321-2716",
    email: "card@briansunter.com",
    website: "briansunter.com"
  ),
  // Customize colors
  colors: (
    primary: rgb("#0077be"),    // Main accent color
    background: rgb("#ffffff"), // Card background
  ),
  // Card format settings
  format: (
    size: "us",  // us, eu, jp, cn
    flip: false
  )
)

