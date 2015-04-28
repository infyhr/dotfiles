" VIM config 2.0
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jistr/vim-nerdtree-tabs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Behave mswin for me
source $VIMRUNTIME/mswin.vim
behave mswin

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

" Show visual tab characters. (testing)
set list
set listchars=tab:>.
set listchars=tab:»·,trail:·

" Do incremental searches
set incsearch

" Ignore cases
set ignorecase

" Smart search?
set scs

" Allow syntax highlighting
syntax on

" Status line configuration is below:
set laststatus=2
set statusline=%F%m%r%h%w\ [%l/%L]\ %<[%{&ff}]\%h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\\"}%k\ %-14.(%l,%c%V%)\ %P\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Highlighting specific parts of the buffer
highlight Comment ctermfg=black
highlight StatusLine ctermfg=black ctermbg=white

" No wrapping for me, not a fan.
set nowrap

" Backspace should delete four (4) characters since it's the length of a TAB char (which are spaces)
set softtabstop=4

" Use CTRL+T to spawn new tab and CTRL+W to destroy. Also movement.
nmap <C-t> <Esc>:tabnew<CR><Esc>
nmap <C-w> <Esc>:tabclose<CR><Esc>
nmap <C-Left> <Esc>:tabp<CR><Esc>
nmap <C-Right> <Esc>:tabn<CR><Esc>

" Set the color scheme
set background=light
colorscheme jellybeans

" I don't like the sound of bells, so I disabled them.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use TAB to indent lines.
vnoremap <Tab> >

" Bind F3 to open and close NerdTree.
autocmd VimEnter * nmap <F3> :NERDTreeTabsToggle<CR>
autocmd VimEnter * imap <F3> <Esc>:NERDTreeTabsToggle<CR>a
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35

" Save as UTF-8 and remove anything that has to do with BOM.
set nobomb
set fileencoding=utf-8
set encoding=utf-8

" This fixes some cursor flickering that might occur.
set guicursor=a:block-Cursor
"set guicursor+=i:blinkon0
set guicursor+=i:ver20-Cursor

" Smart HOME key -- when HOME is pressed, go to the first occurance of a character and not to the beginning of the line.
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" No need for backups.
set nobk

" Use F9 to toggle between visible whitespace
nnoremap <F9> :set list!<CR>

" Move tabs right and left.
function TabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

function TabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
endfunction

nmap <silent><C-S-Right> :execute TabRight()<CR>
nmap <silent><C-S-Left> :execute TabLeft()<CR>

" Map cw to change inner word. I tend to mix these up quite often.
nmap cw ciw

" Disable autocomments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=oi

" No swap.
set noswapfile

" ff=unix
set ff=unix

" Make it so we can change the color of the status line depending on the mode we are in.
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold guisp=Red
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" Use Control+K to remove a line.
imap <C-k> <Esc>dd<CR><Esc>i

" CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
