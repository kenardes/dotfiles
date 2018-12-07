"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/bundle/repos/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/bundle/repos')
  call dein#begin('$HOME/.config/nvim/bundle/repos')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.config/nvim/bundle/repos/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')   " dark powered neo-completion
"  call dein#add('sheerun/vim-polyglot')   " A collection of language packs for Vim.

"  call dein#add('wsdjeg/dein-ui.vim')   " UI for Shougo's dein.vim
  call dein#add('vim-airline/vim-airline')
  call dein#add('xolox/vim-misc')   " Miscellaneous auto-load Vim scripts
  call dein#add('xolox/vim-session')   " Extended session management for Vim

  " Haskell IDE
  call dein#add('neovimhaskell/haskell-vim')   " Syntax Highlighting and Indentation for Haskell and Cabal
  call dein#add('neomake/neomake')   " Asynchronous linting and make framework for Neovim/Vim
  call dein#add('alx741/vim-hindent')   " auto indent
  call dein#add('eagletmt/neco-ghc')   " haskell completion plugins of deoplete.nvim

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


""" neovimhaskell/haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 0
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2


""" neomake
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
"call neomake#configure#automake('nrwi', 500)
let g:neomake_open_list = 2
let g:neomake_verbose = 3


"""
" Disable automatic comment insertion
" harus ditaruh dibaris terahir karena bisa di overwrite sama plugins
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
