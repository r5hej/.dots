set nocompatible
filetype off

" ==========================  Plugins  ========================== "


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'Vundle.vim'
"Plugin 'auto-pairs'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scooloose/syntastic'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype indent plugin on
filetype plugin on


" ==========================  Plugins  ========================== "

" ==========================  Settings ========================== "

syntax on

set list
"set number
set wildmenu
set hlsearch
set nobackup
set t_Co=256
set incsearch
set smartcase
set autoindent
set smartindent
set laststatus=2
set shortmess+=c
set softtabstop=4
set statusline+=%*
set encoding=utf-8
set listchars=tab:▸·,trail:⋅
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" ===== airline ===== "
let g:airline_detect_spell = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ===== colors ===== "
let g:airline_theme ='simple'
colorscheme monokai

" ===== syntastic ===== "
let g:syntastic_check_on_wq = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { "passive_filetypes": ["tex"] }


" ===== flake8 ===== "
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_python_exec = '/usr/bin/python3'





"let python_highlight_all=1

" ==========================  Settings ========================== "

" ==========================  Keybinds ========================== "

nmap	<TAB>	    :w<ENTER>:bnext<ENTER>
map	<C-n>	    :NERDTreeToggle<CR>
map	<C-j>	    <C-w>j
map	<c-k>	    <C-w>k
map	<c-l>	    <C-w>l
map	<c-h>	    <C-w>h

" ==========================  Keybinds ========================== "
