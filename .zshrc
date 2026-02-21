# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# zmodload zsh/zprof# Disable omz update
DISABLE_AUTO_UPDATE=true

# Homebrew setup...
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  echo "Warning: Homebrew is not installed..."
fi

# Basic .zshrc setup
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

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
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# bun setup
if [[ -d "$HOME/.bun" ]]; then
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  # bun completions
  [ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
fi


# Roblox installer
if [[ -f "$HOME/.aftman/env" ]]; then
  . "$HOME/.aftman/env"
fi

CP3M="$HOME/Desktop/dev/cpp-bunler/cp3m/dist"
if [[ -d "$CP3M" ]]; then
  export PATH="$CP3M:$PATH"
fi

# Vulkan SDK
if [[ -d "$HOME/VulkanSDK/1.3.290.0" ]]; then
  export VULKAN_SDK="$HOME/VulkanSDK/1.3.290.0"
  export PATH="$VULKAN_SDK/bin:$PATH"
  export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
  export VK_ICD_FILENAMES="$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json"
  export VK_LAYER_PATH="$VULKAN_SDK/etc/vulkan/layer.d"
fi

# Use this cmake path, as brew can be quite behind
if [[ -d "/Applications/CMake.app" ]]; then
  export PATH="/Applications/CMake.app/Contents/bin:$PATH"
fi

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
