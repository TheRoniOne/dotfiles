set number
set cursorline
set incsearch
set hlsearch

nnoremap ‹leader›‹space› :nohlsearch‹CR›

augrup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

