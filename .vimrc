" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" language support
Plug 'mattn/emmet-vim'
Plug 'davidhalter/jedi-vim'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'yuezk/vim-js', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'sheerun/vim-polyglot'

" Input support
Plug 'jiangmiao/auto-pairs'

" Autocomplete
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" treesitter highlight
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" appearance
Plug 'ryanoasis/vim-devicons'
" surround
Plug 'tpope/vim-surround'

" telescope
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Comment out
Plug 'scrooloose/nerdcommenter'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'
", { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'christoomey/vim-tmux-navigator'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug 'gruvbox-community/gruvbox'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'


" Initialize plugin system
call plug#end()
" Put your non-Plugin stuff after this line

autocmd!
scriptencoding utf-8
if !1 | finish | endif

"General Settings
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on  "Enabling Plugin & Indent

" To ignore plugin indent changes, instead use:
"filetype plugin on
set encoding=UTF-8
set fileencodings=utf-8,sjis,euc-jp,latin
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
"set spell spelllang=en_us
set backspace=indent,eol,start confirm
" intend
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic
set path+=**
set wildmode=longest,list,full
set wildmenu
set rnu nu
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup
set nowrap
set title
set showcmd
set cmdheight=1
set clipboard=unnamed
"set clipboard+=unnamedplus
set smartcase
set incsearch
"set hlsearch
set hidden
set scrolloff=10

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" YCM
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme gruvbox

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Command settings
command! MakeTags !ctags -R
" ctrl+] to jum to tage under cursor
" g+ctrl+] for ambiguous tags
" ctrl+t to jump back up the tag stack

"augroup VCenterCursor
  "au!
  "au BufEnter,WinEnter,WinNew,VimResized *,*.*
        "\ let &scrolloff=winheight(win_getid())/2
"augroup END

"Key mapping

let mapleader = " "
" inoremap jj <Esc>
inoremap jj <Esc>
cnoremap jk <C-C>

" moving up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" window navigation
nnoremap <leader>j :<C-w>j<cr>
nnoremap <leader>k :<C-w>k<cr>
nnoremap Y y$

" tab key 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"Display setting
"nnoremap <expr> <Leader>z 0 == &scrolloff ? ':setlocal scrolloff=999<CR>'  
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
tnoremap <Esc> <C-\><C-n>

"Running code
autocmd FileType python map <buffer> <F2> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"Env settings
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let NERDTreeShowHidden=1
"let g:NERDTreeIgnore = ['^node_modules$']

" telescope keymapping
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"Nerdtree setting
"sync open file with NERDTree
 " Check if NERDTree is open or active
"function! IsNERDTreeOpen()        
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

"" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

