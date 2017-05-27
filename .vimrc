# Download and install:
# https://github.com/tpope/vim-pathogen
# https://github.com/scrooloose/nerdtree
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
imap <F10> <ESC><F10>
imap <F11> <ESC><F11>
imap <C-L> <ESC><C-L>
imap <C-Y> <ESC><C-Y>i
set statusline=[%2n]\ %f%=line\ %m\ %l/%-8L\ col\ %c
set laststatus=2

set shiftwidth=4
autocmd Filetype ocaml setlocal shiftwidth=2

if executable("opam")
  let s:opam_path = systemlist("opam config var prefix")[0]
  execute ("autocmd Filetype ocaml source " . s:opam_path . "/share/ocp-indent/vim/indent/ocaml.vim")
  unlet s:opam_path
endif

execute pathogen#infect()
