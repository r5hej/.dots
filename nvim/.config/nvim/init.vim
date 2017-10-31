if &compatible
  set nocompatible
endif

" ======================================== Plugins ======================================== "

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.config/nvim'))

call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neopairs.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Shougo/context_filetype.vim')
" call dein#add('Shougo/deol.nvim')

call dein#add('kien/ctrlp.vim')
call dein#add('mileszs/ack.vim')
"call dein#add('neomake/neomake')
call dein#add('neomake/neomake', {'on_ft' : ['py']})
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('vim-airline/vim-airline')
call dein#add('jiangmiao/auto-pairs')
call dein#add('scrooloose/nerdcommenter')
call dein#add('easymotion/vim-easymotion')
call dein#add('vim-airline/vim-airline-themes')

if dein#check_install()
    call dein#install()
endif

call dein#end()

filetype plugin indent on
syntax enable

" ======================================== Plugins ======================================== "

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

let g:tex_flavor='latex'

" =============== Neovim ================ "
" =============== Colors ================ "

colorscheme monokai
let g:airline_theme = 'simple'

" =============== Colors ================ "
" =============== Airline =============== "

let g:airline_detect_spell = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" =============== Airline =============== "
" ============ NERDCommenter ============ "

" let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

" ============ NERDCommenter ============ "
" =============== Deoplete ============== "

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" =============== Deoplete ============== "
" =============== Neomake =============== "

" autocmd! bufwritepost,bufenter *.py neomake
let g:neomake_autoline_sign_column_always = 1

" =============== Neomake =============== "
" ======================================== Setting ======================================== "

" ===================================== File specific ===================================== "

au FileType tex setlocal spell spelllang=en_us

" ===================================== File specific ===================================== "

" ======================================= Key Maps ======================================== "
" ============== NERDTree =============== "

nmap <C-n>                          :NERDTreeToggle<cr>

" ============== NERDTree =============== "
" ============== Easymotion ============= "

nmap <leader>f                      <Plug>(easymotion-sn)

" ============== Easymotion ============= "
" ================ Deople =============== "

inoremap <expr><tab>                pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab>              pumvisible() ? "\<c-p>" : "\<S-tab>"

" ================ Deople =============== "
" =============== Neomake =============== "

nmap <leader>lo                     :lopen<cr>
nmap <leader>lc                     :lclose<cr>

" =============== Neomake =============== "
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

nmap <tab>                          :bnext<cr>
nmap <S-tab>                        :bprevious<cr>

if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    tnoremap <Esc> <C-\><C-n>
endif



" ============= Navigation ============== "
" ======================================= Key Maps ======================================== "
