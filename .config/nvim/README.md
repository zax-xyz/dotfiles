# neovim

note: this is still undergoing a migration to lua/builtin LSP. currently focusing on LSP, will also migrate from vim-plug to packer, and overall restructuring/refactoring

## setup

dependencies:
- neovim (obviously)
- git
- npm
- unzip

all plugin/lsp dependencies should be auto installed by the config

1. clone this repo
2. copy or symlink this folder into your `~/.config`[^1]
3. start up nvim and let vim-plug auto install itself and the plugins
4. then restart nvim to let mason install the lsp servers (`:Mason` to view progress)

[^1]: i like using bare repos (setup in [root readme](/README.md#shell-setup)), but this will use *all* of my dotfiles, not just nvim
