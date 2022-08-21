" Install vim-plug if it is not found, then install plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Update plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Load plugins
call plug#begin('~/.vim/plugged')

" Functionality
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'

if !exists('g:vscode')
  Plug 'navarasu/onedark.nvim'

  Plug 'tpope/vim-commentary'
  Plug 'suy/vim-context-commentstring'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ciaranm/detectindent'
  Plug 'andymass/vim-matchup'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'dominikduda/vim_current_word'
  Plug 'andweeb/presence.nvim'
  Plug 'famiu/bufdelete.nvim'

  " Extra wacky shit that goes on the screen
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'majutsushi/tagbar'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kdheepak/tabline.nvim'

  " Language-related plugins
  Plug 'iloginow/vim-stylus'
  Plug 'lervag/vimtex'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  Plug 'turbio/bracey.vim', {'do': 'npm i --prefix server'}
  Plug 'mattn/emmet-vim'
  Plug 'rustushki/JavaImp.vim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Plug 'github/copilot.vim'
endif

call plug#end()

if !exists('g:vscode')
  luafile ~/.config/nvim/plugins/onedark.lua
  luafile ~/.config/nvim/plugins/treesitter.lua
  source ~/.config/nvim/plugins/telescope.vim
  source ~/.config/nvim/plugins/coc.vim
  source ~/.config/nvim/plugins/tex.vim
  source ~/.config/nvim/plugins/emmet.vim
  source ~/.config/nvim/plugins/JavaImp.vim
  source ~/.config/nvim/plugins/matchup.vim
  source ~/.config/nvim/plugins/vim_current_word.vim
  luafile ~/.config/nvim/plugins/lualine.lua
  luafile ~/.config/nvim/plugins/tabline.lua
endif
