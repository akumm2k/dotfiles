#!/usr/bin/env zsh

# Load zshrc subsets
for file in .exports .private-exports .aliases; do
    # suppress shellcheck warning for sourcing non-constant path
    # shellcheck source=/dev/null
    [[ -e "$HOME/.zsh/$file" ]] && source "$HOME/.zsh/$file"
done

# Configure fuck alias
eval "$(thefuck --alias)"

# Initialize starship
eval "$(starship init zsh)"

# .hushlogin suppresses message of the day,
# which may contain important info
if [[ -e "/etc/motd" ]]; then
    cat /etc/motd
fi