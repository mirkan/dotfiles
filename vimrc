" Syntax highlightning
syntax on
" Reload vimrc after save
autocmd! bufwritepost .vimrc source %

" Colorscheme
set background=dark
colorscheme solarized

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

" Xdebug
let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : 'vagrant',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}
" Trim trailing whitespace
autocmd FileType c,cpp,java,php autocmd BufWritePre * :%s/\s\+$//e
