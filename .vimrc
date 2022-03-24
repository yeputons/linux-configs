set ai
set number
set expandtab

filetype on
autocmd!
syntax on

nnoremap <F10> :bp!<CR>
nnoremap <F11> :bn!<CR>
nnoremap <C-L> :ls<CR>
nnoremap <C-Y> dd<CR>
nnoremap <C-N> :tabnew<CR>
imap <F10> <ESC><F10>
imap <F11> <ESC><F11>
imap <C-L> <ESC><C-L>
imap <C-Y> <ESC><C-Y>i
imap <C-N> <ESC><C-N>
set statusline=[%2n]\ %f%=line\ %m\ %l/%-8L\ col\ %c
set laststatus=2

set shiftwidth=4
colorscheme slate
