# dotfiles

It's just my dotfiles

Currently the main programs I use are:

- ~~WM: bspwm
- **Keybindings**: sxhkd
- **Status Bar**: polybar
- **Compositor**: picom
- **Terminal**: st
- **Shell**: zsh (no frameworks)
- **Text Editor**: neovim
- **Application Launcher**: dmenu, rofi
- **Notifications**: dunst
- **Display Manager**: ~~lightdm~~ GDM
- **Browser**: firefox, brave, chromium
- **File Manager**: Nautilus (GUI), vifm (TUI)
- **PDF Viewer**: Zathura, evince
- **Music**: ~~MPD + ncmpcpp~~ Spotify

## Setup

Based on [Atlassian's guide to storing dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

<!-- treesitter won't highlight with just sh :( -->
```bash
# install dependencies (assumes arch-based system, for other systems use the relevant package manager)
sudo pacman -S zsh neovim nodejs git exa # node used for coc in neovim

# if only need read-only
git clone --bare https://github.com/zaxutic/dotfiles.git $HOME/.cfg
# or if need to push commits as well (me) (requires ssh key configured with github)
git clone --bare git@github.com:zaxutic/dotfiles.git $HOME/.cfg

alias dgit="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
dgit checkout
# **remove any conflicting existing files and rerun previous command if necessary**

dgit config --local status.showUntrackedFiles no
dgit config --local pull.rebase false

dgit submodule init
dgit submodule update

# skip past the error messages to let neovim auto install vim-plug and plugins
vim
# quit vim and restart vim to install coc plugins, then quit again

chsh # choose /bin/zsh or wherever zsh is located

# restart shell
```
