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

# FNM Compatibility Setup
# Determine the operating system
OS_TYPE="$(uname -s)"
# Set FNM_DIR based on the operating system
if [[ "$OS_TYPE" == "Darwin" ]]; then
  # macOS (both Intel and Apple Silicon)
  export FNM_DIR="$HOME/Library/Application Support/fnm"
elif [[ "$OS_TYPE" == "Linux" ]]; then
  # Linux (including WSL)
  export FNM_DIR="$HOME/.fnm"
else
  echo "Unsupported platform for FNM"
fi
if [[ -d "$FNM_DIR" ]]; then
  export PATH="$FNM_DIR:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi


# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
# zprof > temp.txt