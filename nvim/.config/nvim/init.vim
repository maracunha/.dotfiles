set path+=**

" I don,t know if I need this
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tamago324/nlsp-settings.nvim'    " language server settings defined in json for
Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters

" cmp plugins
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path' 
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lua'

" theme
Plug 'morhetz/gruvbox'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'ayu-theme/ayu-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" improves Vim's spell checking function
Plug 'kamykn/spelunker.vim'
Plug 'lewis6991/spellsitter.nvim'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Neovim Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" A git commit browser
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" HARPOON!!
Plug 'ThePrimeagen/harpoon'
Plug 'mhinz/vim-rfc'

call plug#end()

" My remaps
let mapleader = " "
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>   
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>wv :Vex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>x :!chmod +x %<CR> 

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" not know exactly what it does
nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" git things
nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>

" greatest remap ever
xnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap Y yg$

" center cursor on quick find
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"copy hole file
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" that one is mine
nnoremap <leader>vfa :silent :EslintFixAll<CR>

" requires my configs made in lua
lua require("maracunha.lsp")
lua require("maracunha.cmd")
lua require("maracunha.treesitter")
lua require("maracunha.spellsitter")
lua require("maracunha.harpoon")

" disable python only using python3
let g:loaded_python_provider = 0
