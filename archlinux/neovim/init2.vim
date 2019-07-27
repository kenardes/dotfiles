let g:python_host_prog = '/home/opoel34/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/opoel34/.pyenv/versions/neovim3/bin/python'

" enable mouse support
set mouse=a mousemodel=popup

" True color in neovim wasn't added until 0.1.5
" Set colors in terminal
" Solarized, dark, with true color support
if has('nvim-0.1.5')
    set termguicolors
    colorscheme slate
    set bg=dark
endif

" clipboard tanpa register
set clipboard+=unnamedplus

" show line number on left
set nu

" displays trailing whitespace in red
set list
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)

" restore last-position of cursor
:au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

:set cursorline

"" switch between buffer
map <C-PageUp> :bprevious<CR>
map <C-PageDown> :bnext<CR>
map <C-w> :bdelete<CR>
map <C-t> :Ntree<CR>

"" switch between split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""
" Disable automatic comment insertion
" harus ditaruh dibaris terahir karena bisa di overwrite sama plugins
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
