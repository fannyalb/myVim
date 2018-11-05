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
Plugin 'vim-airline/vim-airline'		" Statusline
Plugin 'vim-airline/vim-airline-themes'	" Statusline-Themes
Plugin 'elzr/vim-json'					" Better Json suppor
if has('nvim')
	Plugin 'ncm2/ncm2'			" for NVIM-Completion
	Plugin 'roxma/nvim-yarp'	" for NVIM-Completion
endif

""" NCM2
Plugin 'ncm2/ncm2-github'
Plugin 'ncm2/ncm2-gtags'
Plugin 'yuki-ycino/ncm2-dictionary'
Plugin 'ncm2/ncm2-path'
Plugin 'ncm2/ncm2-syntax'
Plugin 'ncm2/ncm2-jedi'				"  Python
Plugin 'ncm2/ncm2-pyclang'			" C/C++
"Plugin 'ncm2/ncm2-vim'				" Vimscript
Plugin 'ObserverOfTime/ncm2-jc2'	" Java
Plugin 'ncm2/ncm2-match-highlight'
Plugin 'ncm2/ncm2-highprio-pop'
"Plugin 'ncm2/ncm2-phpactor'
Plugin 'ncm2/ncm2-ultisnips'
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
set spelllang=de_at


""" Mappings and Leader

let mapleader="\<space>"
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
imap "a ä
imap "o ö
imap "u ü
imap "s ß
imap "A Ä
imap "U Ü
imap "O Ö

""" SHORTCUTS
" Use ; for commands
nnoremap ; :
" Use : for ;
nnoremap : ;
" Use Q to execute default register  
nnoremap Q @q


""" Airline
let g:airline_theme = 'solarized'


""" UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-N>"
let g:UltiSnipsEditSplit="vertical"


""" Vimtex
let g:vimtex_compiler_progname = 'nvr'


""" NCM2 - Completion Manager

au BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more info
set completeopt=noinsert,menuone,noselect
au User Ncm2Plugin call ncm2#register_source({
			\ 'name' : 'vimtex',
			\ 'priority': 1,
			\ 'subscope_enable': 1,
			\ 'complete_length': 1,
			\ 'scope': ['tex'],
			\ 'matcher': {'name': 'combine',
			\           'matchers': [
			\               {'name': 'abbrfuzzy', 'key': 'menu'},
			\               {'name': 'prefix', 'key': 'word'},
			\           ]},
			\ 'mark': 'tex',
			\ 'word_pattern': '\w+',
			\ 'complete_pattern': g:vimtex#re#ncm,
			\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
			\ })
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"s
set noshowmode

