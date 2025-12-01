# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.pre.bash"
# Bash Init.
# Bash is not as feature rich as zsh, so using it is generally not as nice.
echo "⚠️  Warning: You are currently running Bash. Consider using Zsh instead for a better experience!"
. "$HOME/.cargo/env"
. "$HOME/.aftman/env"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash"
