#!/usr/bin/env zsh

# Load zshrc subsets
for file in .exports .private-exports .aliases .zprofile; do
    # suppress shellcheck warning for sourcing non-constant path
    # shellcheck source=/dev/null
    [[ -e "$HOME/.zsh/$file" ]] && source "$HOME/.zsh/$file"
done

# Initialize starship
eval "$(starship init zsh)"

# .hushlogin suppresses message of the day,
# which may contain important info
if [[ -e "/etc/motd" ]]; then
    cat /etc/motd
fi

## NVM
export NVM_DIR="$HOME/.nvm"
# shellcheck source=/usr/local/opt/nvm/nvm.sh disable=SC1091
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# shellcheck source=/usr/local/opt/nvm/etc/bash_completion.d/nvm disable=SC1091
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
