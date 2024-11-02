# Personal config for terminal stuff.

## Top Notes

- `.bashrc` and `.profile` are both used for bash shells, which is not as feature rich as zsh. Basically, don't use them.

## Installs

- double click `Abernathy.itermcolors`
- in `iterm -> settings -> profiles -> colors -> color presets...` select Abernathy
- double click `UbuntuMono-Regular.ttf`
- `iterm -> settings -> profiles -> text -> font` choose Ubunutu Mono + Regluar + 17, line height 110
- `iterm -> profiles -> keys -> key mappings -> presets -> natural text editing`
```shell
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile

brew install --cask iterm2
brew install neofetch
brew install --cask amazon-q
brew install fzf
```