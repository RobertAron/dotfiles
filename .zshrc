# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
echo "ZSH Starting"

# Basic .zshrc setup
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Make Programs generally available
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ZSH path setup.
export ZSH="$HOME/.local/share/fig/plugins/ohmyzsh"

# ZSH theme
eval "$(starship init zsh)"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)


# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
