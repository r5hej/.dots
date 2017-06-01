" ======================================== Setting ======================================== "
" =============== Neovim ================ "

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
"set termguicolors
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

" =============== Neovim ================ "
" =============== Colors ================ "

colorscheme monokai

" =============== Colors ================ "
" ======================================== Setting ======================================== "
" ======================================= Key Maps ======================================== "
" ============== Shortcuts ============== "

nmap <leader><space>                :noh<cr>
nmap <leader>ev                     :e ~/.config/nvim/init.vim<cr>
nmap <leader>dd                     :bd<cr>
nmap <leader>D                      :bd!<cr>
vmap <leader>y                      "+y
nmap <leader>p                      "+p
map :W                              :w

" ============== Shortcuts ============== "
" ============= Navigation ============== "

imap jk                             <ESC>
imap kj                             <ESC>

nmap <C-k>                          <C-w>k
nmap <C-j>                          <C-w>j
nmap <C-l>                          <C-w>l
nmap <C-h>                          <C-w>h

nmap <leader>j                      :m+1<cr>
nmap <leader>k                      :m-2<cr>

nmap <tab>                          :bnext<cr>
nmap <S-tab>                        :bprevious<cr>

" ============= Navigation ============== "
" ======================================= Key Maps ======================================== "
