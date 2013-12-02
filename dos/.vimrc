" Config by Infy :D
" Allow backspace to do anything? I don't get this
set backspace=indent,eol,start

" Let's see everything vim's doing! -> BAD IDEA.
"set verbose=9

" Do the indentation automatically
set autoindent
    " 4 spaces for TABs
set shiftwidth=4
set tabstop=4
    " Dunno?
set smarttab
set smartindent

" Spaces, not TABs
set expandtab

" Use mouse to select shit around, very useful.
set selectmode=mouse

" vim, no vi. VIM.
set nocompatible

" ??????? ???? ?? ?
set cmdheight=2

" Don't keep backups
set nobackup
set nowritebackup

" Numbers on the left hand side.
set number

" Show the cursor position all the time!
set ruler

" Show (partial) commands
set showcmd

" do incremental searches (annoying but handy);
set incsearch

" Show  tab characters. Visual Whitespace.
set list
"set listchars=tab:>.
set listchars=tab:»·,trail:·

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
set scs

" can haz shiny
syntax on
filetype plugin indent on

" +++ Make it obvious which mode we are in
set laststatus=2 " always show status line
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
highlight Comment ctermfg=black
highlight StatusLine ctermfg=black ctermbg=white

" no wrapping plz
"set nowrap

"set insertmode

" mappings
" inoremap <C-l> <C-o>
" inoremap <C-o> <C-o>:w
" inoremap <C-c> <C-o>:q!
" inoremap <C-x> <C-o>:q<CR>
" inoremap <C-w> <C-o>/
" inoremap <C-k> <C-o>dd
" inoremap <C-u> <C-o>P

" WRITE TO FILE
map <C-O> <Esc>:w<CR>i
imap <C-O> <Esc>:w<CR>i
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
imap <c-s> <c-o><c-s><CR>

" EXIT
map <C-X> <Esc>:wq<CR>
imap <C-X> <Esc>:wq<CR>
map <C-X><C-X> <Esc>:q!<CR>
imap <C-X><C-X> <Esc>:q!<CR>

" PASTE
map <C-V> <Esc>P
imap <C-V> <Esc>P<Esc>i

" COPY
map <C-C> <Esc>yy
imap <C-C> <Esc>yy<Esc>i

" CUT
map <C-K> <Esc>dd
imap <C-K> <Esc>dd<Esc>i
map <C-U> <Esc>dd
imap <C-U> <Esc>dd<Esc>i
"map <C-X> <Esc>dd
"imap <C-X> <Esc>dd<Esc>i

" i like to paste
set pastetoggle=<F4>

" SELECT ALL
map <C-A> ggVGyG$A
imap <C-A> <Esc>ggVGyG$A

" SELECT ALL + DEL -> DELETE EVERYTHING!
map <C-A-Del> ggVGyG$AggdG$A
imap <C-A-Del> <Esc>ggVGyG$AggdG$A

"map <C-A> <Esc>gg"*yG
"imap <C-A> <Esc>gg"*yG<Esc>i

" UNDO IN INSERT MODE
imap <C-Z> <c-o>u

" DELETE LAST WORD
imap <C-BS> <C-W>

" BACKSPACE DELETES 4 SPACES
set softtabstop=4

" CODING MAPPINGSSSSSSSSSSSSSSSS
inoremap ( ()<Esc>i
inoremap () () <Right><Esc>i
inoremap {<CR> {<CR>}<Left><CR><Up><Tab><Esc>A
inoremap [ []<Esc>i
inoremap [] []<Right><Esc>i
inoremap ' ''<Esc>i
inoremap '' ''<Right><Esc>i
inoremap " ""<Esc>i
inoremap "" ""<Right><Esc>i

" ADD THE SPELL CHECK
set spell

" USE SHIFT TO SELECT STUFF AROUND WITH CURSOR KEYS :D
behave mswin

" TABS AND SHIT IN GVIM YO
 map  <C-l> :tabn<CR>
 map  <C-h> :tabp<CR>
 map  <C-t> :tabnew<CR>
 map  <C-w> :tabclose<CR>"
