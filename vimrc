" Bye, vi
set nocompatible
syntax on
set encoding=utf-8
" Comma is an easier leader key to hit
let mapleader = ","

" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Tabs are four spaces wide
set tabstop=4
" Newlines should start at the same level as the line above
set autoindent
" When indenting, indent by four spaces
set shiftwidth=4
" Always indent to a multiple of shiftwidth
set shiftround
" This is here to wrap Git commit messages to 72 chars.
filetype indent plugin on
autocmd FileType ruby,erb,haml setlocal shiftwidth=2 tabstop=2 expandtab

" Display when in insert/visual/replace mode in the status bar
set showmode
" Show the number of selected characters in visual mode
set showcmd
" Allow hiding buffers that have changes
set hidden
" If files are modified outside Vim, read them automatically
set autoread

" When changing buffers with :e, match with wildcards
set wildmenu
" Personal preference; I like the immediate visual feedback
set wildmode=list:longest

" Display a minimum of three lines above/below the cursor in the window
set scrolloff=3
" No audible bell
set visualbell
" For better redrawing, allegedly
set ttyfast
" Maintain a persistent undo file
set undofile

" Underline the current line
set cursorline
" Display the cursor's location in the file in the bottom right
set ruler
" Use relative line numbers rather than absolute ones
set relativenumber
" Set a visual indicator of 72 chars for text wrapping on commit msg
autocmd FileType gitcommit set colorcolumn=72 spell

set backspace=indent,eol,start
set laststatus=2

" Pathogen is the nicest way to load plugins
call pathogen#infect()

" Set up Airline
set guifont=Inconsolata\ for\ Powerline:h16
let g:airline_powerline_fonts = 1

" Always use Perl-style regular expressions
nnoremap / /\v
vnoremap / /\v

" Display invisibles
set list
set listchars=trail:·,precedes:«,extends:»,eol:¬,tab:▸\ 

" We're using a 256 colour terminal.
set t_Co=256
" Set the default theme
" let g:zenburn_high_Contrast = 1
colorscheme monokai

" The next few settings set up a nice find-as-you-type that ignores case when
" you want to but is case-sensitive when you want it to be as well
set ignorecase
set smartcase
set incsearch
set hlsearch
" Replace all occurences on a line by default; makes s///g go back to replacing
" just the first.
set gdefault
" Highlight matching brackets
set showmatch
" Type comma-space to clear search highlighting
nnoremap <leader><space> :noh<cr>
" Use tab to move through matching brackets/braces
nnoremap <tab> %
vnoremap <tab> %

" No-wrap text
set nowrap
" Wrap at 72 chars wide
set textwidth=72
set formatoptions=qrn1
autocmd FileType md,markdown,modula2 setlocal formatoptions+=t

" Space in normal mode centres the screen on the current line
nmap <space> zz

" Unmap arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Unmap help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" In insert mode, double-tap J to enter command mode.
inoremap jj <ESC>

" comma-W: strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" strip trailing whitespace on save
autocmd FileType css,scss,sass,html,php,javascript,js,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" comma-A: start an Ack search
nnoremap <leader>a :Ack
" comma-S: sort CSS properties alphabetically
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" comma-q: hard-wrap current paragraph
nnoremap <leader>q gqip
" comma-w: hard-wrap current line as though it was a paragraph
nnoremap <leader>w o<ESC>kgqip}dd
" comma-v: select the just-pasted text
nnoremap <leader>v V`]
" Set paste, paste, set nopaste
nnoremap <Leader>P :set paste<CR>o<esc>"*]p:set nopaste<cr>
" comma-=: align assignments in current block
nnoremap <leader>= :Tab /=<CR>
" comma-[: put array element on a new line
nnoremap <leader>[ f,a<CR><ESC>

" Cmd-j/k deletes blank line below/above, and Ctrl-j/k inserts.
nnoremap <silent><D-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><D-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" comma-vrc opens vimrc in a new tab and automagically sources on save
map <leader>vimrc :tabe ~/dotfiles/vimrc<cr>
autocmd bufwritepost vimrc source $MYVIMRC

" bindings for CommandT as <leader>t is used by easyMotion
" e is for edit so Ctrl-e is a reasonable mapping
" b is for buffer so Ctrl-b is the thinking where search is limited to buffer
nnoremap <silent> <C-e> :CommandTFlush<cr>\|:CommandT<CR>
nnoremap <silent> <C-b> :CommandTFlush<cr>\|:CommandTBuffer<CR>
let g:CommandTMaxHeight=25
let g:CommandTMatchWindowReverse=1 

" mappings for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" bindings for NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" add auto close tags to filetypes that use HTML
au Filetype php,html,xml,xsl source ~/dotfiles/vim/bundle/closetag/closetag.vim
" set up mappings for tag closing
" set macmeta
inoremap <C-D-.> <C-R>=GetCloseTag()<CR>
map <C-D-.> a<C-D-.><ESC>

" project specific tab settings
" people do love to argue about tabs vs. spaces but this way you can 
" override the sensible default settings of using tabs
autocmd BufNewFile,BufRead ~/Sites/wigwamm/listing-app/* set nowrap et ts=2 sw=2
