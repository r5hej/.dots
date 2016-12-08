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
Plugin 'edkolev/tmuxline.vim'
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
set number
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
let g:airline#extensions#tmuxline#enabled = 0

" ===== colors ===== "
let g:airline_theme ='simple'
colorscheme monokai

" ===== syntastic ===== "
let g:syntastic_check_on_wq = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { "passive_filetypes": ["tex"] }
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_python_exec = '/usr/bin/python3'

" ===== YouCompleteMe ===== "
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1




let mapleader = ','


" ==========================  Settings ========================== "

" ======================== File specific ======================== "

au FileType tex set spell spelllang=en_us

" ======================== File specific ======================== "

" ==========================  Keybinds ========================== "

nmap	<TAB>	    :w<cr>:bnext<cr>
nmap	<Leader>bd  <cr>:bd<cr>
nmap	<Leader>ev  :tabedit ~/.vimrc<cr>
map	<C-n>	    :NERDTreeToggle<cr>
map	<C-j>	    <C-w>j
map	<C-k>	    <C-w>k
map	<C-l>	    <C-w>l
map	<C-h>	    <C-w>h

" ==========================  Keybinds ========================== "
