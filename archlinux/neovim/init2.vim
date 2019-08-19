let g:python_host_prog = '/home/opoel34/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/opoel34/.pyenv/versions/neovim3/bin/python'


" "" auto save & load session
" if argc() == 0
"   let g:arg = 0
" else
"   let g:arg = 1
" endif
"
" function! LoadSession()
"   if !empty(glob("~/.config/nvim/session.vim"))
"     source ~/.config/nvim/session.vim
" "    if g:arg == 1
" "      bfirst
" "    if g:arg == 0
" "       source ~/.config/nvim/session.vim
" "    endif
"   else
"     echo "No session loaded."
"   endif
" endfunction
"
" if g:arg == 0
"   :autocmd VimLeave * mksession! ~/.config/nvim/session.vim
"   :autocmd VimEnter * nested :call LoadSession()
" endif


""" vim-airline/vim-airline
" vim powerline options
"let g:airline_theme='bubblegum'

" don't overwrite symbols if they already exist
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.crypt = ''
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"let g:airline_symbols.linenr = '☰'

let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'short_path'


" enable mouse support
set mouse=a mousemodel=popup


" True color in neovim wasn't added until 0.1.5
" Set colors in terminal
" Solarized, dark, with true color support
if has('nvim-0.1.5')
    set termguicolors
"    colorscheme slate
    colorscheme gruvbox
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


"" Highlight the screen line of the cursor
set cursorline


"" Persistent undo
:set undofile


"" Ignore case in search patterns
set ic


"" switch between buffer
map <C-PageUp> :bprevious<CR>
map <C-PageDown> :bnext<CR>
map <C-w> :bdelete<CR>
map <C-t> :Ntree<CR>
" nnoremap <F5> :buffers<CR>:buffer<Space>


"" better :bro ol
set nohidden
command! Bro :enew | setl buftype=nofile |  0put =v:oldfiles
  \| nnoremap <buffer> <CR> gf | 1
""
:autocmd VimEnter * :enew | setl buftype=nofile |  0put =v:oldfiles
  \| nnoremap <buffer> <CR> gf | 1


"" switch between split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"" Manually remove trailing whitespace on current buffer
"" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
fun! WhitespaceTrimmer()
    let l:save = winsaveview()
"    keeppatterns %s/\s\+$//e
    keeppatterns %s/\s\+$//gc
    call winrestview(l:save)
endfun
command! WhitespaceTrimmer call WhitespaceTrimmer()


set wildmenu
set wildmode=full


if !has('nvim')
   "something for neovim
endif


"""
" Disable automatic comment insertion
" harus ditaruh dibaris terahir karena bisa di overwrite sama plugins
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

