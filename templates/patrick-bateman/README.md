# Business Card Generator in Typst

A Typst template for generating elegant business cards, inspired by the iconic business card scene from American Psycho. 

> Look at that subtle off-white coloring. The tasteful thickness of it. Oh my God, it even has a watermark.
## Prerequisites

- [Typst](https://typst.app/) installed on your system
- [just](https://github.com/casey/just) command runner (optional)

## Building

### Using just (recommended)
You can use the provided justfile to build the project:

- `just compile` - Compile the business card once
- `just watch` - Watch for changes and recompile automatically
- `just clean` - Remove generated files

### Manual compilation
If you don't want to use just:

1. Clone this repository
2. Modify `main.typ` with your information:
3. Run `typst compile main.typ` to generate the business card.

## Reference
### Original
![Original](./images/image.png)
### Typst 
![Typst](./images/typst.png)