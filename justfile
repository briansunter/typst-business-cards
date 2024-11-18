# Default recipe to display available commands
default:
    @just --list

# Build all templates
all:
    #!/usr/bin/env bash
    echo "Building all templates..."
    cd templates
    for dir in */; do
        echo "Checking directory: $dir"
        if [ -f "${dir}main.typ" ]; then
            template=${dir%/}
            echo "Found main.typ in $template"
            echo "Building $template..."
            just build "$template"
            if [ $? -eq 0 ]; then
                echo "Successfully built $template"
            else
                echo "Failed to build $template"
                exit 1
            fi
        else
            echo "No main.typ found in $dir"
        fi
    done
    echo "All templates built successfully"

# Compile a specific template's business card to PDF, SVG, and PNG
build TEMPLATE="simple-modern":
    #!/usr/bin/env bash
    echo "Compiling templates/{{TEMPLATE}}/main.typ..."
    # Create images directory if it doesn't exist
    mkdir -p images
    # Compile PDF
    typst compile templates/{{TEMPLATE}}/main.typ templates/{{TEMPLATE}}/output.pdf
    # Compile SVG
    typst compile --format=svg templates/{{TEMPLATE}}/main.typ images/{{TEMPLATE}}.svg
    # Compile PNG with higher PPI for better quality
    typst compile --format=png --ppi 300 templates/{{TEMPLATE}}/main.typ images/{{TEMPLATE}}.png

# Watch for changes and recompile a specific template (all formats)
watch TEMPLATE="simple-modern":
    #!/usr/bin/env bash
    # Start three watch processes in the background
    typst watch --root templates/{{TEMPLATE}} templates/{{TEMPLATE}}/main.typ templates/{{TEMPLATE}}/output.pdf &
    typst watch --root templates/{{TEMPLATE}} --format=svg templates/{{TEMPLATE}}/main.typ images/{{TEMPLATE}}.svg &
    typst watch --root templates/{{TEMPLATE}} --format=png --ppi 300 templates/{{TEMPLATE}}/main.typ images/{{TEMPLATE}}.png &
    # Wait for any process to finish
    wait

# Clean build artifacts for all templates
clean:
    find . -name "output.pdf" -type f -delete
    find images -name "*.svg" -type f -delete
    find images -name "*.png" -type f -delete

# Open the compiled PDF for a specific template
view TEMPLATE="simple-modern": (build TEMPLATE)
    @if [ "$(uname)" = "Darwin" ]; then \
        open templates/{{TEMPLATE}}/output.pdf; \
    elif [ -x "$(command -v xdg-open)" ]; then \
        xdg-open templates/{{TEMPLATE}}/output.pdf; \
    elif [ "$(uname -s)" = "Windows_NT" ]; then \
        start templates/{{TEMPLATE}}/output.pdf; \
    else \
        echo "Could not determine how to open PDF on this system"; \
    fi

# Create a new business card template
new-template NAME:
    @mkdir -p {{NAME}}
    @echo "#let business-card(name: none, email: none, phone: none) = {" > {{NAME}}/business-card-template.typ
    @echo "  // Add your template code here" >> {{NAME}}/business-card-template.typ
    @echo "}" >> {{NAME}}/business-card-template.typ
    @echo '#import "business-card-template.typ": business-card\n\n#business-card(\n  name: "Your Name",\n  email: "email@example.com",\n  phone: "000 000 0000"\n)' > {{NAME}}/main.typ

# Install Typst (requires Cargo)
install-typst:
    cargo install typst-cli

# Check Typst version
version:
    typst --version

# List available templates
list-templates:
    @find . -type d -depth 1 -not -path '*/\.*' -exec basename {} \;