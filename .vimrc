" 2014
" vim:set et fdm=marker:

" {{{ Plugins 
" To install vim-plug: curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" Colourschemes
        Plug 'altercation/vim-colors-solarized'
        Plug 'nyanpasu/suwako'
        Plug 'tomasr/molokai'

" Rice
        Plug 'bling/vim-airline'             " Status line
        Plug 'jaxbot/semantic-highlight.vim' " Highlight variables with rainbow diarrhea
        Plug 'vim-scripts/TagHighlight'      " Hightlight functions and class variables

" Utility
        Plug 'jiangmiao/auto-pairs'    " Handle pairs
        Plug 'SirVer/ultisnips'        " Superb snippet support
        Plug 'Valloric/YouCompleteMe'  " Semantic autocompleter and diagnostic server
        Plug 'godlygeek/tabular'       " Meh alignment plugin (TODO replace with vim-easy-align)
        Plug 'honza/vim-snippets'      " Complement to ultisnips that provide actual snippets (TODO fork and apply own snippets)
        Plug 'kien/ctrlp.vim'          " Fuzzy based file search
        Plug 'majutsushi/tagbar'       " Display buffer tags in window
        Plug 'scrooloose/nerdtree'     " Neato file browser for when ctrl-P and file explorer suck
        Plug 'steffanc/cscopemaps.vim' " cscope vim key mappings
        Plug 'tmhedberg/matchit'       " Superb extension for % commands
        Plug 'tpope/vim-fugitive'      " Best vim git wrapper
        Plug 'tpope/vim-surround'      " Powerful plugin to man handle surroundings
        Plug 'tpope/vim-commentary'    " Commenting on steroids
        Plug 'michaeljsmith/vim-indent-object'

" Miscellaneous
        Plug 'wlue/vim-dm-syntax' " Dream maker syntax

call plug#end()

" }}}
" {{{ General
set nocompatible   " Get rid of vi compatibility mode
syntax on          " Enable syntax highlighting
set nowrap         " Don't wrap text
set number         " Show current line number
set relativenumber " Relative number line
set mouse=a        " Enable mouse
set incsearch      " Highlight as you type your search
set expandtab      " Use spaces instead of tabs
set shiftwidth=8   " How large an indent is
set tabstop=8      " How large a tab is displayed
set softtabstop=8  " Use a mix of tab/spaces rounded to this value
set smarttab       " Use tabs at the start of a line, spaces elsewhere
set autoindent     " Copy indent from current line when starting new line
set smartindent    " Indent inserted after: line ending in {, keyword, before line starting with
set shortmess+=|   " Disable hit-enter prompts
set t_Co=256       " Enable 256-color mode
set smartcase      " Smart searching. Lowercase -> case insensitive search; Uppercase -> case sensitive search
set ignorecase     " So that smart searching works
set modeline       " Enabled modeline

set tags +=/usr/include

filetype indent plugin on

" }}}
" {{{ Keybinds
" View Highlight group under cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map <F4> :bd<CR>
map <F5> :bprev!<CR>
map <F6> :bnext!<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>

map <F9> :NERDTreeToggle<CR>
map <F10> :TagbarToggle<CR>
" Toggle search highlights
nnoremap <silent> <C-l> :set hls!<CR>
" Toggle listchars
nnoremap <silent> <C-k> :set list!<CR>

set pastetoggle=<F2>

if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
endif

" }}}
" {{{ Plugins config

let g:ycm_add_preview_to_completeopt                = 1
let g:ycm_auto_trigger                              = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_collect_identifiers_from_tags_files       = 1
let g:ycm_complete_in_comments                      = 1
let g:ycm_confirm_extra_conf                        = 0
let g:ycm_error_symbol                              = '⛔'
let g:ycm_warning_symbol                            = '⛔'
let g:ycm_enable_diagnostic_signs                   = 1
let g:ycm_global_ycm_extra_conf                     = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax              = 1
let g:ycm_use_ultisnips_completer                   = 1
let g:ycm_filepath_completion_use_working_dir       = 0

let g:UltiSnipsUsePythonVersion    = 2 " Holy shit, I spent two hours trying to get this to just werk.
let g:UltiSnipsExpandTrigger       = "<c-y>"
let g:UltiSnipsJumpForwardTrigger  = "<c-y>"
let g:UltiSnipsJumpBackwardTrigger = "<c_u>"

let Tlist_Use_Right_Window = 1

let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1

" }}}
" {{{ Rice

let g:rehash256 = 1
colorscheme suwako
"let g:molokai_original = 1
"let g:semanticColors = { 0x00: '72d572', 0x01: 'c5e1a5', 0x02: 'e6ee9c', 0x03: 'fff59d', 0x04: 'ffe082', 0x05: 'ffcc80', 0x06: 'ffab91', 0x07: 'bcaaa4', 0x08: 'b0bec5', 0x09: 'ffa726', 0x0a: 'ff8a65', 0x0b: 'f9bdbb', 0x0c: 'f9bdbb', 0x0d: 'f8bbd0', 0x0e: 'e1bee7', 0x0f: 'd1c4e9', 0x10: 'ffe0b2', 0x11: 'c5cae9', 0x12: 'd0d9ff', 0x13: 'b3e5fc', 0x14: 'b2ebf2', 0x15: 'b2dfdb', 0x16: 'a3e9a4', 0x17: 'dcedc8' , 0x18: 'f0f4c3', 0x19: 'ffb74d' }
"set bg=dark

set cursorline
set encoding=utf-8
set laststatus=2

" Change fill character for vertical borders (Note: might want to use │)
set fillchars+=vert:\ 

set listchars=tab:┊\ ,eol:¬,extends:>,precedes:<

set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{\{{\\d\\=','','g')
set fillchars+=fold:\ 

" }}}
" {{{ Custom functions

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

" }}}
