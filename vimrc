" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Syntax highlightning
colorscheme solarized
syntax on
set wrap
set number
set nocompatible
set splitright
set background=dark
set ignorecase
set smartcase
set shiftwidth=4
set tabstop=4

" Hightlighting colors
highlight SpecialKey guifg=#545454
highlight NonText guifg=#545454

" Activate mouse
"set mouse+=a

" Reload vimrc after save
autocmd! bufwritepost .vimrc source %

" Trim trailing whitespace
autocmd FileType sh,py,java,php,html,css autocmd BufWritePre * :%s/\s\+$//e

" Auto indent
filetype indent plugin on

" Set chars for tabs and newlines
set listchars=tab:▸\ ,eol:¬,trail:%

" TEMPLATES/SKELETONS
autocmd BufNewFile  *.php	0r ~/.vim/templates/template.php
autocmd BufNewFile  *.py	0r ~/.vim/templates/template.py
autocmd BufNewFile  *.sh	0r ~/.vim/templates/template.sh
autocmd BufNewFile  *.html	0r ~/.vim/templates/template.html

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

"ino <down> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
"ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Map F2 to save and close
map <F2> :wq!<CR>

" PLUGINS
" Toggle NERDtree
nmap <C-n> :NERDTreeToggle<CR>

" Save as root
" command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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

" vimwiki
let g:vimwiki_list = [{
	\ 'path': '$HOME/wiki/',
	\ 'path_html': '$HOME/wiki/html/',
  	\ 'template_path': '$HOME/wiki/templates/',
	\ 'template_default': 'default',
	\ 'template_ext': '.html'}]

" youcompleteme
let g:ycm_autoclose_preview_window_after_insertion = '1'

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F']
