# dotfiles

It's just my dotfiles

Currently the main programs I use are:

- **~~WM~~ DE**: ~~bspwm~~ Gnome
- **Keybindings**: ~~sxhkd~~ Gnome
- **Status Bar**: ~~polybar~~ Dash to Panel (Gnome)
- **Compositor**: ~~picom~~ Mutter (Gnome)
- **Terminal**: st
- **Shell**: zsh (no frameworks)
- **Text Editor**: neovim
- **Application Launcher**: ~~dmenu, rofi~~ Gnome
- **Notifications**: ~~dunst~~ Gnome
- **Display Manager**: ~~lightdm~~ GDM
- **Browser**: firefox, brave, chromium
- **File Manager**: ~~Nautilus (GUI), vifm (TUI)~~ Nautilus
- **PDF Viewer**: ~~Zathura, evince~~ evince
- **Music**: ~~MPD + ncmpcpp~~ Spotify

## Setup

Based on [Atlassian's guide to storing dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

<!-- treesitter won't highlight with just sh :( -->
```bash
# install dependencies for arch-based systems
sudo pacman -S zsh neovim nodejs git exa # node used for coc in neovim

# if only need read-only
git clone --bare https://github.com/zaxutic/dotfiles.git $HOME/.cfg
# or if need to push commits as well (me) (requires ssh key configured with github)
git clone --bare git@github.com:zaxutic/dotfiles.git $HOME/.cfg

alias dgit="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
dgit checkout
# **remove any conflicting existing files and rerun previous command if necessary**

dgit config --local status.showUntrackedFiles no

dgit submodule init
dgit submodule update

# skip past the error messages to let neovim auto install vim-plug and plugins
vim
# quit vim and restart vim to install coc plugins, then quit again

# restart shell
```
