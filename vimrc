" 2019-04-25 author
" =============================
" Plugin Management
" =============================

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

if has("win32")
	set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
	call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
	set rtp+=~/.vim/bundle/Vundle.vim/
	call vundle#rc(s:editor_root . '/bundle')
	call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'					" Latex vor vim
Plugin 'vim-syntastic/syntastic.git'	" syntax checking
Plugin 'SirVer/ultisnips'				" Snippets Engine
Plugin 'honza/vim-snippets'				" Predefined snippets
Plugin 'tpope/vim-surround'				" Surround vim 
Plugin 'tpope/vim-repeat'				" Surround vim 
Plugin 'tpope/vim-fugitive'				" Vim Wrapper for Git
Plugin 'tpope/vim-sensible'				" Vim Defaults everyone can agree on
Plugin 'tpope/vim-unimpaired'			" mappings for next and prev
Plugin 'tpope/vim-commentary'			" mappings for next and prev
Plugin 'scrooloose/nerdtree'
Plugin 'cpp.vim'
Plugin 'peterhoeg/vim-qml'
Plugin 'altercation/vim-colors-solarized'
Plugin 'matze/vim-tex-fold'
Plugin 'tmhedberg/SimpylFold'		" Folding
Plugin 'vim-scripts/indentpython'	" Python Intedation
Plugin 'hail2u/vim-css3-syntax'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'bitc/vim-hdevtools' 		" Haskell
call vundle#end()

" =============================
" General Settings and Mappings
" =============================

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
set relativenumber
colorscheme solarized
filetype plugin on 
syntax on

""" Mappings and Leader
if &ft =~ 'asciidoc\|adoc\|txt\|tex'
	imap "a ä
	imap "o ö
	imap "u ü
	imap "s ß
	imap "A Ä
	imap "U Ü
	imap "O Ö
endif


""" Capitalize word
nnoremap <C-G> wbg~l
""" Navigating between split
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader="\\"
let maplocalleader="<space>"

" Find next occurence and do the same as before
" For multiple replacing
nnoremap R @='n.'<CR>


" jump to next error of ycm
:nnoremap <F2> :lnext<CR>
" Global replace of variable/function
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Autocomplete more simple
inoremap <C-X><C-N> <C-N>
inoremap <C-X><C-P> <C-P>

""" SHORTCUTS
" Use ; for Command
nnoremap ; :
" Use : for ;
nnoremap : ;
" Use Q to execute default register  
nnoremap Q @q
" Autoclose Brackets
" inoremap { {<CR>}<Esc>ko
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap " ""<Esc>i
" inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")" 
" inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]" 
" inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}" 
" inoremap <expr> \" strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"" 


" Properly display man pages
runtime ftplugin/man.vim
if has("gui_running")
	nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
endif

" Mappings for Languages
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <F3> :HdevtoolsClear<CR>

" ===============
" Status Line
" ===============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" ===============
" Autocmds
" ===============
if has("autocmd")
	augroup templates
		autocmd BufNewFile Makefile 0r ~/.vim/templates/skeleton.makefile
	augroup END
endif

" ===============
" Plugin Settings
" ===============

""" Vimtex
" let g:vimtex_compiler_progname = 'nvr'
let g:Tex_SmartJeyQuote=0
let g:vimtex_quickfix_methode="pplatex"
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_autoclose_after_keystrokes=0


""" Ultisnips
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit='context'
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']


""" Syntastic """
let g:synstastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

