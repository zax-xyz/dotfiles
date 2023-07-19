# dotfiles

It's just my dotfiles

Currently the main programs I use are:

- **WM**: bspwm
- **Keybindings**: sxhkd
- **Status Bar**: polybar
- **Compositor**: picom
- **Terminal**: kitty
- **Shell**: zsh (no frameworks)
- **Text Editor**: neovim
- **Application Launcher**: dmenu, rofi
- **Notifications**: dunst
- **Display Manager**: ~~lightdm~~ GDM
- **Browser**: firefox, brave, chromium
- **File Manager**: Nautilus (GUI), vifm (TUI)
- **PDF Viewer**: Zathura, evince
- **Music**: ~~MPD + ncmpcpp~~ Spotify

## Shell Setup

Based on [Atlassian's guide to storing dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

<!-- treesitter won't highlight with just sh :( -->

```bash
# install dependencies (assumes arch-based system, for other systems use the relevant package manager)
sudo pacman -S zsh neovim npm git exa unzip

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
# quit vim and restart vim to install lsp plugins, then quit again

chsh # choose /bin/zsh or wherever zsh is located

# restart shell
```

## Desktop Setup

Assumes the steps to clone the repo as above have been followed

```bash
# basic
sudo pacman -S bspwm sxhkd polybar dmenu rofi conky dunst picom feh xss-lock ttc-iosevka rofi-emoji

# other
sudo pacman -S firefox nautilus vifm zathura evince redshift nextcloud-client flameshot clipmenu deepin-calculator thunderbird kdeconnect
paru -S spotify spicetify-cli networkmanager-dmenu-git

# TODO: finish this
```

## Plans

- Migrate from Polybar to [eww](https://github.com/elkowar/eww) (and maybe use it for some other stuff as well)
- Maybe migrate from BSPWM to [Hyprland](https://hyprland.org/)
- Migrate away from Dunst
  - [wired-notify](https://github.com/Toqozz/wired-notify) and [linux_notification_center](https://github.com/phuhl/linux_notification_center) seem nice, but unfortunately neither of them support Wayland at the moment, which might become a problem. There's a couple Wayland notification daemons ([mako](https://github.com/emersion/mako) and [fnott](https://codeberg.org/dnkl/fnott)), but they don't seem as flexible as I want. Maybe this is an opportunity to make my own
