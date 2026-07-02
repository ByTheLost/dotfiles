# Commands

# Home
```
sudo pacman -Syu
mkdir -p ~/projects ~/code ~/dev ~/work
set -Ux PROJECT_PATHS ~/projects ~/code ~/dev ~/work
```

## Fish plugins
```
fisher install jorgebucaran/nvm.fish
fisher install patrickf1/fzf.fish
fisher install oh-my-fish/plugin-pj
```

```
sudo pacman -S --needed base-devel git zellij wget

wget -O ~/.config/zellij/plugins/zjstatus.wasm \
https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo pacman -S fish
sudo pacman -S zoxide atuin
yay -S carapace-bin

sudo pacman -S wl-clipboard
sudo pacman -S lazygit
```
