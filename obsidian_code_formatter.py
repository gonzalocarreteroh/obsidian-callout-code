#!/usr/bin/env python3
"""
Obsidian Code Formatter for Callouts

Formats code blocks to work inside Obsidian callouts by adding '>' prefix to each line.
"""

import sys
import argparse
import subprocess


def copy_to_clipboard(text: str) -> bool:
    """
    Copy text to clipboard using pbcopy (macOS).

    Args:
        text: The text to copy

    Returns:
        True if successful, False otherwise
    """
    try:
        process = subprocess.Popen(['pbcopy'], stdin=subprocess.PIPE)
        process.communicate(text.encode('utf-8'))
        return process.returncode == 0
    except Exception:
        return False


def format_code_for_callout(code: str, language: str = "") -> str:
    """
    Format code to be used inside Obsidian callouts.

    Args:
        code: The code to format
        language: Optional language identifier for syntax highlighting

    Returns:
        Formatted code with '>' prefix on each line (except the first)
    """
    # Add code fences
    lines = [f"```{language}", code.rstrip(), "```"]

    # Join and split to handle the code content properly
    full_text = "\n".join(lines)

    # Add '>' prefix to each line, except the first one
    all_lines = full_text.split("\n")
    formatted_lines = []

    for i, line in enumerate(all_lines):
        if i == 0:
            # First line: no '>' prefix
            formatted_lines.append(line)
        else:
            # Other lines: add '>' prefix
            formatted_lines.append(f"> {line}" if line else ">")

    return "\n".join(formatted_lines)


def main():
    parser = argparse.ArgumentParser(
        description="Format code blocks for Obsidian callouts",
        epilog="Examples:\n"
               "  python obsidian_code_formatter.py -l python < script.py\n"
               "  cat config.yaml | python obsidian_code_formatter.py -l yaml\n"
               "  python obsidian_code_formatter.py -l javascript",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )

    parser.add_argument(
        "-l", "--language",
        default="",
        help="Language for syntax highlighting (e.g., python, javascript, yaml)"
    )

    parser.add_argument(
        "-c", "--copy",
        action="store_true",
        help="Automatically copy result to clipboard"
    )

    parser.add_argument(
        "file",
        nargs="?",
        type=argparse.FileType('r'),
        default=sys.stdin,
        help="Input file (defaults to stdin)"
    )

    args = parser.parse_args()

    # Read input
    code = args.file.read()

    if not code.strip():
        print("Error: No input provided", file=sys.stderr)
        sys.exit(1)

    # Format and output
    formatted = format_code_for_callout(code, args.language)
    print(formatted)

    # Copy to clipboard if requested
    if args.copy:
        if copy_to_clipboard(formatted):
            print("\n✓ Copied to clipboard!", file=sys.stderr)
        else:
            print("\n✗ Failed to copy to clipboard", file=sys.stderr)


if __name__ == "__main__":
    main()
