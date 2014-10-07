" Nyanpasu's vimrc 2014

" Main Config
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

syntax on
set nowrap                " don't wrap text
set number
set relativenumber

set mouse=a

set incsearch             " Highlight as you type your search.

set expandtab             " Use spaces instead of tabs
set shiftwidth    =8
set tabstop       =8      " tab spacing
set softtabstop   =8      " unify
set smarttab              " use tabs at the start of a line, spaces elsewhere
set autoindent
set smartindent

set shortmess     +=|
set winaltkeys=no

set t_Co          =256    " enable 256-color mode.

set smartcase             " smart searching. Lowercase -> case insensitive search; Uppercase -> case sensitive search
set hlsearch

set listchars=tab:┊\ ,eol:¬,extends:>,precedes:<

set tags +=/usr/include

" Windows only config
if has("gui_running")
    set guifont=PragmataPro
endif

" Load vundle
"filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" This line should be called after vundle is loaded.
" Vundle is required to have filetype off before loading.
filetype indent plugin on
"End of Main Config

" Keybinds
map <F4> :bd<CR>
map <F5> :bprev!<CR>
map <F6> :bnext!<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <F9> :NERDTreeToggle<CR>
map <F10> :TagbarToggle<CR>

nnoremap <silent> <C-l> : <C-u> nohlsearch <CR><C-l>

nnoremap <silent> <C-k> :set list!<CR>

nnoremap <Leader>t "=strftime("%H:%M:%S")<CR>P

set pastetoggle=<F2>

function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
                !./install.sh
        endif
endfunction

" The package manager plugin itself
" To install: curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" Vim ricing; all customizations plugins
         "Essential file browser
        " Pretty status
        "Plug 'scrooloose/syntastic'
        Plug 'altercation/vim-colors-solarized'
        Plug 'bling/vim-airline'
        Plug 'jaxbot/semantic-highlight.vim'
        Plug 'nanotech/jellybeans.vim'
        Plug 'scrooloose/nerdtree'
        Plug 'tomasr/molokai'
        Plug 'vim-scripts/TagHighlight'

" Utility plugins
        " Huge bloat; very useful
        "Plug 'MarcWeber/vim-addon-mw-utils'
        "Plug 'ervandew/supertab'
        "Plug 'msanders/snipmate.vim'
        "Plug 'tomtom/tlib_vim'
        "Plug 'vim-scripts/c.vim'
        "Plug 'vim-scripts/taglist.vim'
        "Plug 'xolox/vim-easytags'
        "Plug 'xolox/vim-misc'
        Plug 'Raimondi/delimitMate'
        Plug 'SirVer/ultisnips'
        Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM')}
        Plug 'godlygeek/tabular'
        Plug 'honza/vim-snippets'
        Plug 'kien/ctrlp.vim'
        Plug 'majutsushi/tagbar'
        Plug 'steffanc/cscopemaps.vim'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'

" Miscellaneous
        Plug 'wlue/vim-dm-syntax'

call plug#end()

" Plugins config

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

"let g:SuperTabDefaultCompletionType = "context"

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_errorsymbol = '⚠'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_warning_symbol = '⚠'

let g:UltiSnipsUsePythonVersion = 2 " Holy shit, I spent two hours trying to get this to just werk.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c_u>"

"let g:easytags_updatetime_min= 8000

let Tlist_Use_Right_Window = 1
" End of plugins
" Rice

" Colorscheme
let g:rehash256 = 1
colorscheme molokai
let g:molokai_original = 1
let g:semanticColors = { 0x00: '72d572', 0x01: 'c5e1a5', 0x02: 'e6ee9c', 0x03: 'fff59d', 0x04: 'ffe082', 0x05: 'ffcc80', 0x06: 'ffab91', 0x07: 'bcaaa4', 0x08: 'b0bec5', 0x09: 'ffa726', 0x0a: 'ff8a65', 0x0b: 'f9bdbb', 0x0c: 'f9bdbb', 0x0d: 'f8bbd0', 0x0e: 'e1bee7', 0x0f: 'd1c4e9', 0x10: 'ffe0b2', 0x11: 'c5cae9', 0x12: 'd0d9ff', 0x13: 'b3e5fc', 0x14: 'b2ebf2', 0x15: 'b2dfdb', 0x16: 'a3e9a4', 0x17: 'dcedc8' , 0x18: 'f0f4c3', 0x19: 'ffb74d' }
"set bg=dark

set cursorline

" vim-airline configs
set encoding=utf-8
set laststatus=2
let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1

" Change the fill character for vertical borders (Note: might want to use │)
set fillchars+=vert:\ 

" Fold text
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set fillchars+=fold:\ 

" Miscellaneous

" Save folds
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

" Function to right align
function! RightAlignVisual() range
        let lim = [virtcol("'<"), virtcol("'>")]
        let [l, r] = [min(lim), max(lim)]
        exe "'<,'>"
        's/\%'.l.'v.*\%<'.(r+1).'v./\=StrPadLeft(submatch(0),r-l+1)'
endfunction
function! StrPadLeft(s, w)
        let s = substitute(a:s, '^\s\+\|\s\+$', '', 'g')
        return repeat(' ', a:w - strwidth(s)) . s
endfunction

"End of Miscellaneous
