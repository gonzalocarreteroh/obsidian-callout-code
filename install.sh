#!/bin/bash
# Installation script for Obsidian Code Formatter

set -e  # Exit on error

INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="obcode-formatter"
ZSHRC="$HOME/.zshrc"

echo "Installing Obsidian Code Formatter..."

# Create install directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating $INSTALL_DIR..."
    mkdir -p "$INSTALL_DIR"
fi

# Copy the Python script
echo "Installing $SCRIPT_NAME to $INSTALL_DIR..."
cp obsidian_code_formatter.py "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo ""
    echo "WARNING: $INSTALL_DIR is not in your PATH"
    echo "Add the following line to your $ZSHRC:"
    echo ""
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

# Check if obsidian_setup.zsh is already sourced
if ! grep -q "obsidian_setup.zsh" "$ZSHRC" 2>/dev/null; then
    echo ""
    echo "To enable the obcode command, add this to your $ZSHRC:"
    echo ""
    echo "  source $(pwd)/obsidian_setup.zsh"
    echo ""
else
    echo ""
    echo "obsidian_setup.zsh is already sourced in your .zshrc"
fi

echo ""
echo "✓ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Make sure ~/.local/bin is in your PATH (see warning above if needed)"
echo "  2. Source obsidian_setup.zsh in your .zshrc (see message above if needed)"
echo "  3. Restart your terminal or run: source ~/.zshrc"
echo ""
echo "Usage:"
echo "  obcode python    # Interactive mode for Python code"
echo "  obpy             # Shortcut for Python"
echo "  cat file.py | obcode-formatter -l python -c  # Direct usage"
