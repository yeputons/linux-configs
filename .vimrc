syntax on
set ai
set number
set expandtab
nnoremap <F10> :bp!<CR>
nnoremap <F11> :bn!<CR>
nnoremap <C-L> :ls<CR>
nnoremap <C-Y> dd<CR>
imap <F10> <ESC><F10>
imap <F11> <ESC><F11>
imap <C-L> <ESC><C-L>
imap <C-Y> <ESC><C-Y>i
set statusline=[%2n]\ %f%=line\ %m\ %l/%-8L\ col\ %c
set laststatus=2
