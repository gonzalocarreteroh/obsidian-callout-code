# Obsidian Code Formatter - Add this to your ~/.zshrc

# Main function - interactive code formatter for Obsidian callouts
obcode() {
    local language="${1:-}"

    if [[ -z "$language" ]]; then
        echo "Usage: obcode <language>"
        echo "Example: obcode python"
        echo ""
        echo "Then paste your code and press Ctrl+D when done."
        echo "The formatted code will be copied to your clipboard automatically."
        return 1
    fi

    echo "Paste your code (press Ctrl+D when done):"
    obcode-formatter -l "$language" -c
}

# Quick aliases for common languages
alias obpy='obcode python'
alias objs='obcode javascript'
alias obts='obcode typescript'
alias obyml='obcode yaml'
alias objson='obcode json'
alias obsh='obcode bash'
alias obgo='obcode go'
alias obrs='obcode rust'
alias obrb='obcode ruby'
alias objava='obcode java'
