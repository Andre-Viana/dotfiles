set nocompatible " Don't try to be vi compatible
filetype off " Helps force plugins to load correctly when it is turned back on below
filetype plugin indent on " For plugins to load correctly
filetype plugin on
syntax on "Turn on syntax highlighting
map , <Leader>

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8 " The encoding of the generated files
set fileencodings=utf-8
set mouse=a

"" Plugins Section 
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cocopon/iceberg.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

"Use 24-bit (true-color) mode in Vim when outside tmux.
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" colorscheme onedark
"colorscheme PaperColor
colorscheme iceberg
set background=light

let g:vimwiki_list = [{'path': '~/Documentos/vimwiki/', 'path_html': '~/Documentos/vimwiki/html', 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': '~/Documentos/vimwiki/script/wiki2html.sh'}] 

"" General
set number	" Show line numbers

set relativenumber " relative line number
set rnu

set linebreak	" Break lines at word (requires Wrap lines)
"" set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart case search
set ignorecase	" Always case insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto indent new lines
set shiftwidth=4	" Number of auto indent spaces
set smartindent	" Enable smart indent
set smarttab	" Enable smart tabs
set softtabstop=4	" Number of spaces per Tab

"" Finding files
set path+=** " Search down into subfolders.
set wildmenu " Display all matching files when we tab complete
command! MakeTags !ctags -R . "Create the `tags` file (Needs to install ctags first)

" AUTOCOMPLETE:
" In Insert mode
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

"" Spell Check
set spell spelllang=pt,en_gb

"" Advanced
set ruler	" Show row and column ruler information
set nobackup	" get rid of annoying ~file
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"Directory tree ^b
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>

" Auto close braces ans quotes"
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha

