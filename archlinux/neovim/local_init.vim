"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/opoel34/.config/nvim/bundle/repos/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/opoel34/.config/nvim/bundle/repos')
  call dein#begin('/home/opoel34/.config/nvim/bundle/repos')

  " Let dein manage dein
  " Required:
  call dein#add('/home/opoel34/.config/nvim/bundle/repos/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/deoplete.nvim')   " dark powered neo-completion

  call dein#add('vim-airline/vim-airline')
  call dein#add('xolox/vim-misc')   " Miscellaneous auto-load Vim scripts
  call dein#add('xolox/vim-session')   " Extended session management for Vim

  call dein#add('airblade/vim-gitgutter')   " shows a git diff in the 'gutter' (sign column)


  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on
"syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


""" Shougo/neosnippet.vim
""" Shougo/neosnippet-snippets
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


""" Shougo/deoplete.nvim
"call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1


""" vim-airline/vim-airline
" vim powerline options
"let g:airline_theme='dark'

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


""" xolox/vim-session
" exit with :wqa
"set sessionoptions=blank,curdir,folds,help,tabpages,winsize
set sessionoptions-=buffers,options
:let g:session_autoload = 'yes'
:let g:session_autosave = 'yes'
:let g:session_autosave_periodic = 30
:let g:session_default_to_last = 0
:let g:session_persist_font = 0
:let g:session_persist_colors = 0
:let g:session_command_aliases = 1


""" airblade/vim-gitgutter
set updatetime=100
let g:gitgutter_highlight_lines = 1


"""
" Disable automatic comment insertion
" harus ditaruh dibaris terahir karena bisa di overwrite sama plugins
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
