if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/robin/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/robin/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'mrk21/yaml-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'unblevable/quick-scope'
NeoBundle 'morhetz/gruvbox'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Syntax highlightning
colorscheme gruvbox

syntax on
set wrap
set number
set relativenumber
set nocompatible
set splitright
set background=dark
set ignorecase
set smartcase
set shiftwidth=4
set tabstop=4

"hi Normal ctermbg=NONE
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

" Activate dictionary
set dictionary+=/usr/share/dict/words

" Set chars for tabs and newlines
set listchars=tab:▸\ ,eol:¬,trail:%

" TEMPLATES/SKELETONS
autocmd BufNewFile  *.php	0r ~/.vim/templates/template.php
autocmd BufNewFile  *.py	0r ~/.vim/templates/template.py
autocmd BufNewFile  *.sh	0r ~/.vim/templates/template.sh
autocmd BufNewFile  *.html	0r ~/.vim/templates/template.html

" KEY BINDINGS
" Search and Replace. Second line with confirmation.
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>

vmap <C-j> gj
vmap <C-k> gk
vmap <C-4> g$
vmap <C-6> g^
vmap <C-0> g^
nmap <C-j> gj
nmap <C-k> gk
nmap <C-4> g$
nmap <C-6> g^
nmap <C-0> g^

" Map F2 to save and close
map <F2> :wq!<CR>

" PLUGINS
" Save as root
" command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"" quick-scope
let g:qs_highlight_on_keys = ['f', 'F']
