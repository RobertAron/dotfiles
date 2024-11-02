echo "ZSH Starting"
source ~/.zprofile

# Basic .zshrc setup
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Make Programs generally available
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ZSH path setup.
export ZSH="$HOME/.local/share/fig/plugins/ohmyzsh"

# ZSH theme
ZSH_THEME="robbyrussell"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh


# /Users/robertaron/bin:/Users/robertaron/.local/bin:/usr/local/bin:/usr/local/sbin:/Users/robertaron/.bun/bin:/usr/bin:/bin:/Users/robertaron/.local/bin:/Users/robertaron/Desktop/dev/c++/vcpkg:/Users/robertaron/.local/share/fig/plugins/fzf-zsh-plugin_unixorn/bin:/usr/local/opt/fzf/bin
# /Users/robertaron/bin:/Users/robertaron/.local/bin:/Users/robertaron/bin:/Users/robertaron/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/iTerm.app/Contents/Resources/utilities