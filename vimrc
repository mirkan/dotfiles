" Syntax highlightning 
syntax on

" Colorscheme
colorscheme ir_black

set number
set tabstop=4

" Disable arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Add newline w/o insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Auto indent
filetype indent plugin on

" Map F2 to save and close
map <F2> :wq!<CR>

" Save folds automatically
autocmd BufWrite ?. mkview
autocmd BufRead ?. silent loadview 

set dictionary+=/usr/share/dict/words

set listchars=tab:▸\ ,eol:¬
"
" Pathogen
execute pathogen#infect()

" Toggle NERDtree
nmap <C-n> :NERDTreeToggle<CR>

" Hightlighting  colors
" Invisible char colors
highlight SpecialKey guifg=#545454
highlight NonText guifg=#545454
"
" Mouse won't select row numbers
se mouse+=a

