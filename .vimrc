" vim:fdm=marker
" VIM config 3.0 -- Somewhere after graduating universit and being employed after a freaking year, September 2020 :(
" from: https://www.github.com/tobe/dotfiles

" Core {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" Behave mswin for me
source $VIMRUNTIME/mswin.vim
behave mswin
" }}}

" General settings (selection, indendation, personalization) {{{

" So we can select stuff with keys
set selectmode=

" Allow backspace to do several things.
set backspace=indent,eol,start

" Indent settings are below this line:
set autoindent
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set expandtab

" Do not keep backups
set nobackup
set nowritebackup

" Set numbers on the left side
set number

" Show the cursor position at all time
set ruler

" I want a visible cursor line all the time!
set cursorline

" Show visual tab characters. (testing)
set list
set listchars=tab:>.
set listchars=tab:»·,trail:·

" Do incremental searches
set incsearch

" Highlight all search results
set hlsearch

" Ignore cases
set ignorecase

" Smart search?
set scs

" Allow syntax highlighting
syntax on

" No wrapping for me, not a fan.
set nowrap

" Backspace should delete four (4) characters since it's the length of a TAB char (which are spaces)
set softtabstop=4

" Disable autocomments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=oi

" No swap.
set noswapfile

" No need for backups.
set nobk

" Save as UTF-8 and remove anything that has to do with BOM.
set nobomb
set fileencoding=utf-8
set encoding=utf-8

" Automatically change the working directory
set autochdir
 " }}}

" Status line configuration {{{
set laststatus=2
set statusline=%F%m%r%h%w\ [%l/%L]\ %<[%{&ff}]\%h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\\"}%k\ %-14.(%l,%c%V%)\ %P\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Highlighting specific parts of the buffer
"highlight Comment ctermfg=black
"highlight StatusLine ctermfg=black ctermbg=white

" Make it so we can change the color of the status line depending on the mode we are in.
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold guisp=Red
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"  }}}

"  Tabs and buffers {{{
" Use CTRL+T to spawn new tab and CTRL+W to destroy. Also movement.
nmap <C-t> <Esc>:tabnew<CR><Esc>
nmap <C-w> <Esc>:tabclose<CR><Esc>
nmap <A-Left> <Esc>:tabp<CR><Esc>
nmap <A-Right> <Esc>:tabn<CR><Esc>
"  }}}

 " Color scheme {{{
set background=light
colorscheme ron
" }}}

  " Misc {{{
" I don't like the sound of bells, so I disabled them.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }}}

"   Custom keybindings {{{
" Use TAB to indent lines and to unindent
vnoremap <Tab> >
vnoremap <S-Tab> <

" This fixes some cursor flickering that might occur.
set guicursor=a:block-Cursor
"set guicursor+=i:blinkon0
set guicursor+=i:ver20-Cursor

" Smart HOME key -- when HOME is pressed, go to the first occurance of a character and not to the beginning of the line.
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Use F9 to toggle between visible whitespace
nnoremap <F9> :set list!<CR>

" This makes sure when I'm searching that it searches in the middle of the screen so I don't have to bounce around with my eyes.
nnoremap n nzzzv
nnoremap N Nzzzv

" Fix indendation with after the select has been moved from key and mousemode!
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

" Bind F1 to toggle search result highlighting
nnoremap <F1> :set hlsearch!<CR>

" Č <=> :
map č :

" use jj to do ESC
imap jj <Esc>
 " }}}

" vim starts in REPLACE for wsl fix
set t_u7=
