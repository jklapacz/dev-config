" This is set first because it changes many options
set nocompatible
runtime macros/matchit.vim
filetype off

if has("autocmd")
  filetype indent plugin on
end

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VindleVim/Vundle.vim'

" ------- Aesthetics ------- "
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"-------- Make vim a programmer's text editor (project browser tab) ----
Plugin 'scrooloose/nerdtree' 
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic' " syntax highlighting and error catching
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy finding

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- tmux -----------------------------------
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'"

" ---- Ruby ----
Plugin 'ruby-matchit'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'


" ---- Rails ----
Plugin 'tpope/vim-rails'


" ---- Code ----
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


  
call vundle#end()

filetype plugin indent on

" ---- General Settings ----
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set splitright         " Vertical splits use right half of screen

if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same 
endif


" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line
syntax on

set mouse=a

" ------- Plugin Specific Settings -------

" ---- altercation/vim-colors-solarized settings ----
set background=dark

" Uncomment next line if terminal is not configured 
" let g:solarized_termcolors=256

" Set colorscheme
colorscheme solarized 

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ---- bling/vim-airline settings ----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click 'Install'
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1


" Show PASTE if in paste mode
let g:airline_detect_past=1

" Show airline for tabs
let g:airline#extensions#tabline#enabled = 1

" Use solarized theme for Airline status bar
let g:airline_theme='solarized'

" ---- jistr/vim-nerdtree-settings ----
"  open browser tab with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END 


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display 'hunks' if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
  augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', 
augroup END

" ---- Commands ----
" Clear highlighted search with :C
command! C nohlsearch

" Force write readonly files using sudo
command! WS w !sudo tee %
