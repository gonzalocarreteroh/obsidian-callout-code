# Obsidian Code Formatter

A command-line tool to format code blocks for use inside Obsidian callouts. Automatically adds the `>` prefix required by Obsidian's callout syntax.

## Features

- Format code with syntax highlighting for any language
- Automatic clipboard copying (macOS)
- Interactive shell functions with language shortcuts
- Works with stdin, files, or interactive input
- Clean, portable installation

## Installation

### Quick Install

```bash
./install.sh
```

Then add the following to your `~/.zshrc`:

```bash
# Add ~/.local/bin to PATH (if not already there)
export PATH="$HOME/.local/bin:$PATH"

# Source the Obsidian formatter functions
source /path/to/code-to-mrkd/obsidian_setup.zsh
```

Restart your terminal or run:

```bash
source ~/.zshrc
```

### Manual Installation

1. Copy the script to your PATH:
   ```bash
   mkdir -p ~/.local/bin
   cp obsidian_code_formatter.py ~/.local/bin/obcode-formatter
   chmod +x ~/.local/bin/obcode-formatter
   ```

2. Add `~/.local/bin` to your PATH in `~/.zshrc`:
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```

3. Source the helper functions:
   ```bash
   source /path/to/code-to-mrkd/obsidian_setup.zsh
   ```

## Usage

### Interactive Mode (Recommended)

Use the `obcode` command with a language:

```bash
obcode python
# Paste your code, then press Ctrl+D
# Formatted code is automatically copied to clipboard!
```

### Language Shortcuts

Convenient aliases for common languages:

```bash
obpy          # Python
objs          # JavaScript
obts          # TypeScript
obyml         # YAML
objson        # JSON
obsh          # Bash
obgo          # Go
obrs          # Rust
obrb          # Ruby
objava        # Java
```

### Direct Usage

Pipe code directly:

```bash
cat script.py | obcode-formatter -l python -c
```

From a file:

```bash
obcode-formatter -l javascript < app.js
```

Without clipboard copy:

```bash
obcode-formatter -l python < script.py
```

## Examples

### Input

```python
def hello(name):
    print(f"Hello, {name}!")
```

### Output (copied to clipboard)

```python
> def hello(name):
>     print(f"Hello, {name}!")
> 
```

This can be pasted directly into an Obsidian callout:

```markdown
> [!EXAMPLE] Python Example
> ```python
> def hello(name):
>     print(f"Hello, {name}!")
> ```
```

## Options

```
-l, --language LANG    Language for syntax highlighting
-c, --copy            Automatically copy result to clipboard
file                  Input file (defaults to stdin)
```

## Requirements

- Python 3.6+
- macOS (for clipboard functionality via `pbcopy`)
- Zsh (for shell functions)

## License

MIT

## Contributing

Issues and pull requests welcome!