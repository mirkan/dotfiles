" Pathogen
"execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()

" Syntax highlightning
syntax on
set number
set nowrap
set tabstop=4
set splitright
set background=dark
colorscheme solarized

" Hightlighting colors
highlight SpecialKey guifg=#545454
highlight NonText guifg=#545454

" Activate mouse
se mouse+=a

" Reload vimrc after save
autocmd! bufwritepost .vimrc source %

" Save folds automatically
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" Trim trailing whitespace
autocmd FileType c,cpp,java,php autocmd BufWritePre * :%s/\s\+$//e

" Auto indent
" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
filetype indent plugin on

" Activate dictionary
set dictionary+=/usr/share/dict/words

" Set chars for tabs and newlines
set listchars=tab:▸\ ,eol:¬,trail:%

" KEY BINDINGS
" Add newline w/o insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" Search and Replace. Second line with confirmation.
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
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
" Map F2 to save and close
map <F2> :wq!<CR>

" PLUGINS
" Toggle NERDtree
nmap <C-n> :NERDTreeToggle<CR>

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

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
