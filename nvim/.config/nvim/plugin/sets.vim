
set guicursor=
set scrolloff=8
set number
set relativenumber
set tabstop=2  softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set nohlsearch
set hidden
set noerrorbells
set nu

"keep history
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set termguicolors
set noshowmode
set signcolumn=yes
set isfname+=@-@
set spell spelllang=en_us,pt_br
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

set cursorline
set guifont="monospace:h17"

" This was from the colorscheme section
 set termguicolors       " enable true colors support
 let ayucolor="mirage"   " for dark version of theme
 colorscheme ayu
 
