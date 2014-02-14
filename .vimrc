" Hikayu's vimrc 2014
" Remember to use :mkview and :loadview to restore folds and make it easier to
" navigate.

" Main Config
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" Windows only config
if has("gui_running")
    set guifont=PragmataPro
endif

" Load vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This line should be called after vundle is loaded.
" Vundle is required to have filetype off before loading.
filetype indent plugin on
" required for windows
" filetype off
syntax on

set t_Co          =256    " enable 256-color mode.

set incsearch             " But do highlight as you type your search.
set expandtab             " use spaces instead of tabs
set shiftwidth    =8
set tabstop       =8      " tab spacing
set softtabstop   =8      " unify
set smarttab              " use tabs at the start of a line, spaces elsewhere
set autoindent
set smartindent

set nowrap                " don't wrap text
set number

set shortmess     +=|
set winaltkeys=no

set smartcase             " smart searching. Lowercase -> case insensitive search; Uppercase -> case sensitive search
set hlsearch

" set listchars=eol:￢,extends:>,precedes:<
set listchars=eol:¬,extends:>,precedes:<

"End of Main Config

" Keybinds
map <F3> :NERDTreeToggle<CR>
map <F4> :bd<CR>
map <F5> :bprev!<CR>
map <F6> :bnext!<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
" nnoremap <silent> <F9> :TlistToggle<CR>

" Save shortcut
nnoremap \w :w<CR>
nnoremap <C-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" Insert single character
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

nnoremap <silent> <C-l> : <C-u> nohlsearch <CR><C-l>

nnoremap <silent> <C-k> :set list!<CR>

nnoremap <Leader>t "=strftime("%H:%M:%S")<CR>P

set pastetoggle=<F2>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

imap ` <Esc> " Map backtick to escape

" Vundle config

" The package manager plugin itself
Bundle 'gmarik/vundle'

" Vim ricing; all customizations plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'wlue/vim-dm-syntax'

" Utility plugins
"Bundle 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
"Bundle 'tomtom/tlib_vim' " Required by snipmate
"Bundle 'msanders/snipmate.vim' "Replaced by UltiSnips
Bundle 'SirVer/ultisnips'
"Bundle 'ervandew/supertab' " Replaced by YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-easytags'
"Bundle 'vim-scripts/taglist.vim'
"Bundle 'vim-scripts/c.vim'

" Plugins config
"let g:SuperTabDefaultCompletionType = "context"

let g:ycm_warning_symbol = '⚠'
let g:ycm_use_ultisnips_completer = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1

let g:UltiSnipsUsePythonVersion = 2 " Holy shit, I spent two hours trying to get this to just werk.
                                    " Yes. I am indeed retarded.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c_u>"

" End of plugins
" Rice

" Colorscheme
colorscheme solarized
set bg=dark

set cursorline

" vim-airline configs
set encoding=utf-8
set laststatus=2
let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1

" Change the fill character for vertical borders (Note: might want to use │)
set fillchars+=vert:\ 
" but set the LineNumber background to black for some contrast.

" Miscellaneous
" Save folds
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview
"End of Miscellaneous
