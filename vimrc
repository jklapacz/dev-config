" This is set first because it changes many options
set nocompatible

filetype off

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

call vundle#end()

filetype plugin indent on

" ---- General Settings ----
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" ------- Plugin Specific Settings -------

" ---- altercation/vim-colors-solarized settings ----
set background=dark

" Uncomment next line if terminal is not configured 
" let g:solarized_termcolors=256

" Set colorscheme
colorscheme solarized 


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
