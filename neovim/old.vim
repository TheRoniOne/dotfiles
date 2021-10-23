set number
set cursorline
set incsearch ignorecase smartcase hlsearch
set encoding=utf-8
set noerrorbells

:inoremap jj <Esc>

let mapleader=","

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END
