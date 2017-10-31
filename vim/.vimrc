if &compatible
  set nocompatible
endif

" Vim-plug bootstrap
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install missiong plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" ======================================== Plugins ======================================== "

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'

call plug#end()


" =============== Vim ================ "

filetype plugin indent on
syntax enable

set list
set wrap
set number
set hidden
set wildmenu
set autoread
set hlsearch
set nobackup
set et|retab
set t_Co=256
set expandtab
set incsearch
set smartcase
set autoindent
set smartindent
set laststatus=2
set shortmess+=c
set softtabstop=4
set shiftwidth=4
set statusline+=%*
set encoding=utf-8
set listchars=tab:▸·,trail:⋅
set guicursor=n-v-c:blinkon1

let mapleader = ','
au InsertLeave * set nopaste

colorscheme monokai

" =============== Vim ================ "
" ============= Navigation ============== "

nmap <C-n>                          :NERDTreeToggle<cr>

nmap <leader>f                      <Plug>(easymotion-sn)

nmap <leader><space>                :noh<cr>
nmap <leader>ev                     :e ~/.config/nvim/init.vim<cr>
nmap <leader>dd                     :bd<cr>
nmap <leader>D                      :bd!<cr>

imap jk                             <ESC>
imap kj                             <ESC>

nmap <C-k>                          <C-w>k
nmap <C-j>                          <C-w>j
nmap <C-l>                          <C-w>l
nmap <C-h>                          <C-w>h

nmap <tab>                          :bnext<cr>
nmap <S-tab>                        :bprevious<cr>

" ============= Navigation ============== "
