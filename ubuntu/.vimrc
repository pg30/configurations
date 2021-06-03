syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set autoindent
set cindent
set autoread
set nu
set nowrap
set clipboard=unnamedplus
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a
set laststatus=2
set noshowmode

filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git' "after this you need to manually do python3 install.py --clangd-completer for proper c-family completion and syntax checking
Plug 'mbbill/undotree'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'hdima/python-syntax'
Plug 'preservim/nerdcommenter'
call plug#end()

"let g:NERDCreateDefaultMappings=0

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>y ggVGy
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
"YCM
"The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"comment and uncomment c++ code
map ,omg <plug>NERDCommenterAlignLeft
map <C-_> <plug>NERDCommenterToggle 

" comment python code
" autocmd filetype python nnoremap <C-c> :s/^/#<CR>
" autocmd filetype python nnoremap <C-u> :s/^\#<CR>

map <C-n> :NERDTreeToggle<CR>

map <leader>cl ggVGp:w<CR>
"used for directly pasting copied input from contest sample test cases and save it automatically

autocmd filetype cpp nnoremap <C-b> :w <bar> !g++ -ulimit -Wall -Wno-unused-result -std=c++17   -O2   % -o %:r && ./%:r <CR>
autocmd filetype python nnoremap <C-b> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"for modifying config of lightline scheme for narrow windows
let g:lightline = {
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
let g:lightline = {
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ }
"lightline config end

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

