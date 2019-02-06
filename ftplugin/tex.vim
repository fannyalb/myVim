set spell
let g:TexSmartKeyQuote=0
set shiftwidth=2
set tabstop=2
inoremap *<space> \item 


" au BufEnter * call ncm2#enable_for_buffer()
" au User Ncm2Plugin call ncm2#register_source({
"             \ 'name' : 'vimtex',
"             \ 'priority': 1,
"             \ 'subscope_enable': 1,
"             \ 'complete_length': 1,
"             \ 'scope': ['tex'],
"             \ 'mark': 'tex',
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
" set completeopt=noinsert,menuone,noselect

