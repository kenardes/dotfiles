let g:python_host_prog = '/home/opoel34/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/opoel34/.pyenv/versions/neovim3/bin/python'

" Enable syntax highlighting
syntax on

" enable mouse support
set mouse=a mousemodel=popup

" True color in neovim wasn't added until 0.1.5
" Set colors in terminal
" Solarized, dark, with true color support
if has('nvim-0.1.5')
    "set termguicolors
    colorscheme slate
    set bg=dark
endif

" clipboard tanpa register
set clipboard+=unnamedplus

" show line number on left
set nu

" displays whitespace
set list

" restore last-position of cursor
:au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

:set cursorline
":hi CursorLine   cterm=NONE ctermbg=yellow ctermfg=black guibg=yellow guifg=black


"" Include user's local vim config
if filereadable(expand("/home/opoel34/.config/nvim/haskell_init.vim"))
  source /home/opoel34/.config/nvim/haskell_init.vim
endif
