# Personal config for terminal stuff.

![Screenshot of results](screenshot.png)

## Top Notes

- `.bashrc` and `.profile` are both used for bash shells, which is not as feature rich as zsh. Basically, don't use them.

## Installs

- double click `Snazzy.itermcolors`
- in `iterm -> settings -> profiles -> colors -> color presets...` select Snazzy
- `iterm -> settings -> profiles -> text -> font` choose FireCode Nerd Font Mono
- `iterm -> profiles -> keys -> key mappings -> presets -> natural text editing`

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -f .zprofile .zshrc .bashrc  .profile
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.profile ~/.profile

brew install --cask iterm2
brew install --cask amazon-q
brew install --cask font-fira-code-nerd-font
brew install --cask rectangle
brew install neofetch
brew install fzf
brew install starship
brew install nvm
mkdir -p ~/.nvm
```

### VS code color fix

`>preferences: Open User Settings (JSON)`

```json
{
  "terminal.integrated.minimumContrastRatio": 1
}
```

### Git Config

`~/.gitconfig`

```ini
[user]
	name = Robert Aron
	email = robert.aron.tx@gmail.com
[pull]
	rebase = false
[push]
	autoSetupRemote = true
```
