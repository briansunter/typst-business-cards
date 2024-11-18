# Typeset Templates

A collection of professional and modern Typeset templates for various document types.

## Available Templates

<div align="center">

> ### 🎨 Refine
> 
> A refined business card template with classic elegance
> 
> ![Refine Template](images/refine.svg)
> 
> - Classic serif typography with Baskerville
> - Balanced layout with perfect proportions
> - Customizable accent colors and styling
> - Professional contact information presentation
>
> **[View Template →](refine/)**

> ### 📄 Simple Modern
> 
> A clean and minimalist template with modern typography and layout
> 
> ![Simple Modern Template](images/simple-modern.svg)
> 
> - Optimized typography with perfect vertical rhythm
> - Responsive margins and balanced whitespace
> - Support for figures, tables, and code blocks
> - Customizable color schemes and fonts
>
> **[View Template →](simple-modern/)**

> ### 📚 Bold Serif
> 
> A sophisticated template with strong typographic hierarchy
> 
> ![Bold Serif Template](images/bold-serif.svg)
> 
> - Professional serif typography with modern touches
> - Clear section and subsection organization
> - Built-in citation and bibliography support
> - Multiple column layout options
>
> **[View Template →](bold-serif/)**

> ### 📚 Elegant Serif
> 
> A refined academic template with classic styling
> 
> ![Elegant Serif Template](images/elegant-serif.svg)
> 
> - Traditional serif fonts optimized for readability
> - Advanced mathematical typesetting support
> - Integrated figure and table numbering
> - Multiple bibliography style options
>
> **[View Template →](elegant-serif/)**

> ### 👤 Big Name
> 
> A striking resume template with modern aesthetics
> 
> ![Big Name Template](images/big-name.svg)
> 
> - Bold name presentation with custom typography
> - Smart space distribution for content sections
> - Built-in icons and skill rating system
> - Professional contact information layout
>
> **[View Template →](big-name/)**

> ### 💼 Patrick Bateman
> 
> An executive-style resume inspired by classic business cards
> 
> ![Patrick Bateman Template](images/patrick-bateman.svg)
> 
> - Sophisticated business card-inspired design
> - Premium typography and spacing
> - Elegant contact information presentation
> - Subtle textures and professional details
>
> **[View Template →](patrick-bateman/)**

</div>

## Quick Start

1. Make sure you have [Typeset](https://typst.app/) installed
   ```bash
   # Install using Cargo
   just install-typst
   
   # Verify installation
   just version
   ```
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/typset-templates
   ```
3. Navigate to your chosen template directory:
   ```bash
   cd typset-templates/templates/simple-modern  # or other template name
   ```
4. Modify `main.typ` with your content

## Repository Structure
```
.
├── templates/
│   ├── simple-modern/    # Modern minimalist template
│   ├── bold-serif/       # Professional academic template
│   ├── elegant-serif/    # Classic scholarly template
│   ├── big-name/        # Modern resume template
│   └── patrick-bateman/ # Executive resume template
├── images/              # Template previews
├── justfile            # Build automation
└── README.md           # Documentation
```

## Building and Development

This repository includes a `justfile` with several useful commands:

```bash
just                    # Show available commands
just build              # Build specific template (default: simple-modern)
just build bold-serif   # Build a specific template
just all                # Build all templates
just watch simple-modern # Watch template for changes and rebuild
just clean              # Remove all build artifacts
just view              # Open compiled PDF (platform-independent)
just new-template name  # Create a new template scaffold
just list-templates    # List available templates
```

Each template is compiled to multiple formats:
- PDF (for final output)
- SVG (for preview images)
- PNG (high-resolution preview)

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Open a pull request

## License

MIT License - Feel free to use and modify these templates for your projects.

---

<div align="center">
<sub>Built with ❤️ for the Typeset community</sub>
</div>
