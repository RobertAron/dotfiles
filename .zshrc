# zmodload zsh/zprof
# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Disable omz update
DISABLE_AUTO_UPDATE=true

echo "ZSH Starting"
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  echo "Warning: Homebrew is not installed at /opt/homebrew/bin/brew or /home/linuxbrew/.linuxbrew/bin/brew"
fi
# Basic .zshrc setup
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Google Cloud SDK
BREW_PATH=$(brew --prefix)
[[ -f "$BREW_PATH/share/google-cloud-sdk/path.zsh.inc" ]] && source "$BREW_PATH/share/google-cloud-sdk/path.zsh.inc"
[[ -f "$BREW_PATH/share/google-cloud-sdk/completion.zsh.inc" ]] && source "$BREW_PATH/share/google-cloud-sdk/completion.zsh.inc"

# Make Programs generally available
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ZSH theme
export STARSHIP_CONFIG=~/dotfiles/starship.toml
eval "$(starship init zsh)"
# ctrl+r fuzzy searching
source <(fzf --zsh)

# NVM
export NVM_DIR="$HOME/.nvm"
# intel
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
# apple silicon
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
# WSL
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
# zprof > temp.txt