" Run pathogen
execute pathogen#infect()
call pathogen#helptags()

" No compatible, vim.
set nocompatible

" Behave mswin for me (blame me).
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

" Use mouse to select objects (testing)
set selectmode=mouse

" Numbers on the left side.
set number

" Show the cursor position at all times.
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
filetype plugin indent on

" Status line configuration is below:
set laststatus=2
set statusline=%F%m%r%h%w\ [%l/%L]\ %<[%{&ff}]\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" Highlighting specific parts of the buffer
highlight Comment ctermfg=black
highlight StatusLine ctermfg=black ctermbg=white

" No wrapping for me, not a fan.
set nowrap

" $ nano, use Control+X to exit
map <C-X> <Esc>:wq<CR>
imap <C-X> <Esc>:wq<CR>
map <C-X><C-X> <Esc>:q!<CR>
imap <C-X><C-X> <Esc>:q!<CR>

" Backspace should delete four (4) characters since it's the length of a TAB char (which are spaces)
set softtabstop=4

" gVim tabs. I use ALT as a modifier since mod4 is mapped to i3wm.
map  <C-k> <Esc>:tabp<CR><Esc>i
map  <C-Left> <Esc>:tabp<CR><Esc>i
imap  <C-Left> <Esc>:tabp<CR><Esc>i

map  <C-j> <Esc>:tabn<CR><Esc>i
map  <C-Right> <Esc>:tabn<CR><Esc>i
imap  <C-Right> <Esc>:tabn<CR><Esc>i

imap <C-t> <Esc>:tabnew<CR><Esc>i
imap <C-w> <Esc>:tabclose<CR><Esc>i

" I use solarized for my color scheme.
set background=dark
colorscheme solarized

" I dislike the sound of bells so I disabled them.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use TAB to indent lines.
vnoremap <Tab> >

" Bind F3 to open and close NerdTree.
autocmd VimEnter * nmap <F3> :NERDTreeTabsToggle<CR>
autocmd VimEnter * imap <F3> <Esc>:NERDTreeTabsToggle<CR>a
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35

" Bind F2 to use taglist.
autocmd VimEnter * nmap <F2> :TlistToggle<CR>
autocmd VimEnter * imap <F2> <Esc>:TlistToggle<CR>a

" Split buffers (Window navigation). Use ALT+keys. i3wm style.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-k> :wincmd k<CR>

nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-j> :wincmd j<CR>

nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-h> :wincmd h<CR>

nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-l> :wincmd l<CR>  


" Same but with moving windows around.
nmap <silent> <A-S-Up> <C-W>K
nmap <silent> <A-S-K> <C-W>K

nmap <silent> <A-S-Down> <C-W>J
nmap <silent> <A-S-J> <C-W>J

nmap <silent> <A-S-Left> <C-W>H
nmap <silent> <A-S-H> <C-W>H

nmap <silent> <A-S-Right> <C-W>L
nmap <silent> <A-S-L> <C-W>L

nmap <silent> <A-S-T> <C-W>T

" F11 and F12 resize active window (buffer). Also with KP_PLUS and KP_MINUS.
map <silent> <F11> <C-W><
map <silent> <F12> <C-W>>

if bufwinnr(1)
    map <kPlus> <C-W>+
    map <kMinus> <C-W>-
endif

" Switch tabs with CTRL+number (Broken).
map <C-1> 1gt
imap <C-1> <C-O>1gt

map <C-2> 2gt
imap <C-2> <C-O>2gt

map <C-3> 3gt
imap <C-3> <C-O>3gt

map <C-4> 4gt
imap <C-4> <C-O>4gt

map <C-5> 5gt
imap <C-5> <C-O>5gt

map <C-6> 6gt
imap <C-6> <C-O>6gt

map <C-7> 7gt
imap <C-7> <C-O>7gt

map <C-8> 8gt
imap <C-8> <C-O>8gt

map <C-9> 9gt
imap <C-9> <C-O>9gt

map <C-0> 10gt
imap <C-0> <C-O>10gt

" Always show the tab bar in gVim but not in vim
set showtabline=2

" Set up tab labels with tab number, buffer name and number of windows.
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [W: ' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

" Save as UTF-8 and remove anything that has to do with BOM.
set nobomb
set fileencoding=utf-8
set encoding=utf-8

" Alias :Tabmerge and :tm (Tabmerge plugin).
cnoreabbrev <expr> merge ((getcmdtype() is# ':' && getcmdline() is# 'merge')?('Tabmerge'):('merge'))
cnoreabbrev <expr> tm ((getcmdtype() is# ':' && getcmdline() is# 'tm')?('Tabmerge'):('tm'))

" This fixes some cursor flickering that might occur.
set guicursor=a:block-Cursor
set guicursor+=i:blinkon0

" Smart HOME key -- when HOME is pressed, go to the first occurance of a character and not to the beginning of the line.
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Remove the gVim toolbar.
set guioptions-=T
"set guioptions-=r " remove right-hand scroll bar, only if you're hardcore I guess lol

" No need for backups.
set nobk

" Use F10 to toggle between visible whitespace
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

map <silent><C-S-Right> :execute TabRight()<CR>
map <silent><C-S-L> :execute TabRight()<CR>
map <silent><C-S-Left> :execute TabLeft()<CR> 
map <silent><C-S-H> :execute TabLeft()<CR>

" Disable autocomments.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=oi

" Dropdown hack for autocompletes (Enter select the highlighted value)
set completeopt=longest,menuone

" Colors of dropdown.
hi Pmenu guibg=#CCCCCC guifg=#000000

" Bind SHIFT+T to move the window to a new tab
nmap <S-T> :tabedit %<CR>

" Bind CTRL+E to :close!
nmap <C-E> :close!<CR>

" No swap.
set noswapfile

" ff=unix
set ff=unix

" Make it so we can change the color of the status line depending on the mode we are in.
au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=bold guisp=Red
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse

" Use Control+K to remove a line.
imap <C-k> <Esc>dd<CR><Esc>i

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
