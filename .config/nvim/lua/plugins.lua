vim.cmd[[
" Install vim-plug if it is not found, then install plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
Plug 'lewis6991/impatient.nvim'

if !exists('g:vscode')
    Plug 'navarasu/onedark.nvim'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}

    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jayp0521/mason-null-ls.nvim'
    Plug 'simrat39/inlay-hints.nvim'
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'weilbith/nvim-code-action-menu'

    Plug 'tpope/vim-commentary'
    Plug 'suy/vim-context-commentstring'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ciaranm/detectindent'
    Plug 'andymass/vim-matchup'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'dominikduda/vim_current_word'
    Plug 'andweeb/presence.nvim'
    " Plug 'famiu/bufdelete.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'brenoprata10/nvim-highlight-colors'
    Plug 'windwp/nvim-ts-autotag'

    " Extra wacky shit that goes on the screen
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'majutsushi/tagbar'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'kdheepak/tabline.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
    Plug 'tiagovla/scope.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'

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
]]

require("impatient")

if vim.fn.exists('g:vscode') == 0 then
    require("theme")
    require("plugins/treesitter")
    require("plugins/telescope")
    require("lsp")
    require("plugins/tex")
    require("plugins/emmet")
    require("plugins/JavaImp")
    require("plugins/matchup")
    require("plugins/vim_current_word")
    require("plugins/autopairs")
    require("plugins/nvim-highlight-colors")
    require("plugins/nvim-ts-autotag")
    require("plugins/lualine")
    require("plugins/gitsigns")
    require("plugins/bufferline")
    require("plugins/scope")
    require("plugins/indent_blankline")
end
