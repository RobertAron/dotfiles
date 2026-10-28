# Uncomment next line + `zprof` line to performance setup
# zmodload zsh/zprof

# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Disable omz update
DISABLE_AUTO_UPDATE=true
# Auto dedupe PATH values (basically make it a set)
typeset -U path PATH

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
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  [[ -f "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc" ]] && source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
  [[ -f "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
fi

# Make Programs generally available
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ZSH theme
export STARSHIP_CONFIG=~/dotfiles/starship.toml
(( $+commands[starship] )) && eval "$(starship init zsh)"
# ctrl+r fuzzy searching
(( $+commands[fzf] )) && source <(fzf --zsh)

# FNM Compatibility Setup
if (( $+commands[fnm] )); then
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

export CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN=1
CP3M="$HOME/Desktop/dev/cpp-bunler/cp3m/dist"
if [[ -d "$CP3M" ]]; then
  export PATH="$CP3M:$PATH"
fi

# Vulkan SDK
if [[ -d "$HOME/VulkanSDK/1.3.290.0" ]]; then
  export VULKAN_SDK="$HOME/VulkanSDK/1.3.290.0"
  export PATH="$VULKAN_SDK/bin:$PATH"
  export VK_ICD_FILENAMES="$VULKAN_SDK/etc/vulkan/icd.d/MoltenVK_icd.json"
  export VK_LAYER_PATH="$VULKAN_SDK/etc/vulkan/layer.d"
fi

# Use this cmake path, as brew can be quite behind
if [[ -d "/Applications/CMake.app" ]]; then
  export PATH="/Applications/CMake.app/Contents/bin:$PATH"
fi

# ccache setup
if command -v ccache &>/dev/null; then
  export CCACHE_DIR="$HOME/.ccache"
  export CMAKE_C_COMPILER_LAUNCHER=ccache
  export CMAKE_CXX_COMPILER_LAUNCHER=ccache
fi

# Swift toolchain manager
if [[ -f "$HOME/.swiftly/env.sh" ]]; then
  . "$HOME/.swiftly/env.sh"
fi

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
# zprof
