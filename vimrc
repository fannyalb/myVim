set nocompatible		" required for vujjndle
filetype off			" required for vundle

" set runtimepath to include Vundle an initialize
if has('nvim')	
	let s:editor_root=expand("~/.config/nvim")
	set rtp+=~/.config/nvim/bundle/Vundle.vim/
else 
	let s:editor_root=expand("~/.vim")
	set rtp+=~/.vim/bundle/Vundle.vim/
endif

call vundle#begin()
call vundle#rc(s:editor_root . '/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'					" Latex vor vim
Plugin 'vim-syntastic/syntastic.git'	" syntax checking
Plugin 'SirVer/ultisnips'				" Snippets Engine
Plugin 'honza/vim-snippets'				" Predefined snippets
Plugin 'tpope/vim-surround'				" Surround vim 
Plugin 'tpope/vim-repeat'				" Surround vim 
Plugin 'vim-airline/vim-airline'		" Statusline
Plugin 'vim-airline/vim-airline-themes'	" Statusline-Themes
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'dahu/vim-asciidoc'			"Asciidoc for vim
Plugin 'dahu/vimple'				"Needed for Asciidoc for vim
Plugin 'dahu/Asif'					"Needed for Asciidoc for vim
Plugin 'Raimondi/VimRegStyle'		"Needed for Asciidoc for vim
Plugin 'vim-scripts/SyntaxRange'	"Needed for Asciidoc for vim
Plugin 'altercation/vim-colors-solarized'
Plugin 'matze/vim-tex-fold'
Plugin 'tmhedberg/SimpylFold'		" Folding
Plugin 'vim-scripts/indentpython'		" Python Intedation
Plugin 'nvie/vim-flake8'			" Python PEP8 Syntax checking
Plugin 'valloric/YouCompleteMe'		" Code Completition	
Plugin 'ervandew/supertab'		" Using TAb better


call vundle#end()


""" Settings

set showmatch 		" show matching brackets
set textwidth=80	" set textwidth
set number			" Show line numbers
"set expandtab		" Insert spaces when tab is pressed
set tabstop=4		" Render Tabs using this many spaces
set shiftwidth=4	" Indendation amount before < and > command

set nojoinspaces	" Prevents inserting 2 spaces after punctuation and J

set splitbelow		" Horizontal split below current
set splitright		" Vertical split to right of current

if !&scrolloff
	set scrolloff=3	" Show next 3 lines while scrolling
endif

set ignorecase		" Make searching case insensitive
set smartcase		" unless query has capital letters
set laststatus=2
set spelllang=de_at,en_us
set background=dark
set nospell
set guifont=Monospace\ 12
syntax on
colorscheme solarized
filetype plugin on 


""" Mappings and Leader
imap "a ä
imap "o ö
imap "u ü
imap "s ß
imap "A Ä
imap "U Ü
imap "O Ö

nnoremap <C-G> wbg~l
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader="\\"
let maplocalleader="<space>"


""" SHORTCUTS
" Use ; for Command
nnoremap ; :
" Use : for ;
nnoremap : ;
" Use Q to execute default register  
nnoremap Q @q

""" Airline
let g:airline_theme = 'solarized'

""" Vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:Tex_SmartJeyQuote=0
let g:vimtex_quickfix_methode="pplatex"
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_autoclose_after_keystrokes=0

""" make YCM compativle with UltiSnips (using Supertab)
let g:ycm_key_list_select_completition = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completition = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletitionType = '<C-n>'


""" Ultisnips
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit='contex'


""" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



""" NerdCommenter
noremap <C-d> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""" Ascciidoc
autocmd Filetype asciidoc compiler asciidoctor
autocmd Filetype adoc compiler asciidoctor
