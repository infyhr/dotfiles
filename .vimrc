" vim:fdm=marker
" VIM config 2.0 -- 30.04.2015
" from: https://www.github.com/infyhr/dotfiles

" Core {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tomtom/tcomment_vim' " For quickly commenting and uncommenting lines of text
Plugin 'kien/ctrlp.vim' " No need to say anything about this one
    Plugin 'tacahiroy/ctrlp-funky' " Some additions to the ctrlp
Plugin 'scrooloose/nerdtree' " File tree
    Plugin 'jistr/vim-nerdtree-tabs' " 'Add-on' for NerdTree
Plugin 'ervandew/supertab' " TAB completion
Plugin 'bling/vim-airline' " Just eyecandy
"Plugin 'terryma/vim-multiple-cursors' " Can't live without this one
Plugin 'scrooloose/syntastic' " Syntax checker and linter
"Plugin 'tpope/vim-surround' " For more fluent content editing
Plugin 'SirVer/ultisnips' " Snippet engine
    Plugin 'honza/vim-snippets' " Snippets generated for the engine
Plugin 'henrik/vim-indexed-search' " Makes search results more useful. No big changes.
Plugin 'Raimondi/delimitMate' " Automatically add closing brackets, quotes, braces...
Plugin 'heavenshell/vim-pydocstring' " Generate docstrings for python
Plugin 'majutsushi/tagbar' " F2 taglist -- sudo pacman -S ctags

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

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

" ff=unix
set ff=unix

" No need for backups.
set nobk

" Save as UTF-8 and remove anything that has to do with BOM.
set nobomb
set fileencoding=utf-8
set encoding=utf-8
 " }}}

" Status line configuration {{{
set laststatus=2
set statusline=%F%m%r%h%w\ [%l/%L]\ %<[%{&ff}]\%h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\\"}%k\ %-14.(%l,%c%V%)\ %P\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Highlighting specific parts of the buffer
highlight Comment ctermfg=black
highlight StatusLine ctermfg=black ctermbg=white

" Make it so we can change the color of the status line depending on the mode we are in.
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold guisp=Red
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"  }}}

"  Tabs and buffers {{{
" Use CTRL+T to spawn new tab and CTRL+W to destroy. Also movement.
nmap <C-t> <Esc>:tabnew<CR><Esc>
nmap <C-w> <Esc>:tabclose<CR><Esc>
nmap <C-Left> <Esc>:tabp<CR><Esc>
nmap <C-Right> <Esc>:tabn<CR><Esc>

" Move around buffers.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"  }}}

 " Color scheme {{{
set background=light
colorscheme jellybeans
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

" Map cw to change inner word. I tend to mix these up quite often.
nmap cw ciw

" This makes sure when I'm searching that it searches in the middle of the screen so I don't have to bounce around with my eyes.
nnoremap n nzzzv
nnoremap N Nzzzv

" Fix indendation with after the select has been moved from key and mousemode!
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

" Use Control+K to remove a line.
imap <C-k> <Esc>dd<CR><Esc>i

" Make ctrl+c stay on the end of the line
vnoremap <C-C> "+ygv"<Esc>

" Bind F1 to toggle search result highlighting
nnoremap <F1> :set hlsearch!<CR>
 " }}}

 " Plugin specific configuration {{{
" CTRL-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0 " Disable the window
let g:syntastic_auto_loc_list = 0 " This also disables the syntax checking window
let g:syntastic_check_on_open = 0 " Disable error checking on open
let g:syntastic_check_on_wq = 1 " This checks for errors on any write
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Nerdtree
" Bind F3 to open and close NerdTree.
autocmd VimEnter * nmap <F3> :NERDTreeTabsToggle<CR>
autocmd VimEnter * imap <F3> <Esc>:NERDTreeTabsToggle<CR>a
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35

" Taglist
nmap <F2> :TagbarToggle<CR>
" Always open tagbar.
autocmd VimEnter * nested :call tagbar#autoopen(0)
" Bind p to open the tag in the preview window.
let g:tagbar_map_previewwin = "p"
" Bind q to close the tagbar window(s)
let g:tagbar_map_close = "q"
" Show linenumbers in the preview window
let g:tagbar_show_linenumbers = 1
" }}}
