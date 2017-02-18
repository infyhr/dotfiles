" Some colorscheme tweaks
syntax enable
set background=dark
colorscheme cbble

" Set the font
"set guifont="Source\ Code\ Pro\ Semi-Bold\ 10.6"
set guifont=Source\ Code\ Pro\ Semi\-Bold\ 11

" Remove unneeded GUI elements
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar
set guioptions-=m  " Remove the menu bar

" Show always the tab line
set showtabline=2

" NERDTree follow cd
autocmd BufEnter * lcd %:p:h
" Define the NERDTree-aware aliases
call s:DefineCommand("cd", "ChangeDirectory")
call s:DefineCommand("touch", "Touch")
call s:DefineCommand("rm", "Remove")
call s:DefineCommand("e", "Edit")
call s:DefineCommand("mkdir", "Mkdir")

" Cursor stuff
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-iCursor
set guicursor=a:blinkon0

" Tabs should only have the file name, not the full path
set guitablabel=\[%N\]\ %t\ %M
