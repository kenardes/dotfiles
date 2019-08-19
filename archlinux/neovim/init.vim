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
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('vim-airline/vim-airline')   " status line
  call dein#add('morhetz/gruvbox')   " themes

  call dein#add('907th/vim-auto-save')

  " Git
  call dein#add('airblade/vim-gitgutter')   " shows a git diff in the 'gutter' (sign column)

  " Completion Sources for deoplete
  call dein#add('autozimu/LanguageClient-neovim', {
      \ 'rev': 'next',
      \ 'build': 'bash install.sh',
      \ })

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on
syntax enable


" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#update()
  call dein#install()
endif

"End dein Scripts-------------------------
:autocmd VimLeave * :call dein#recache_runtimepath()
" call dein#update()


"" Shougo/neosnippet.vim
"" Shougo/neosnippet-snippets
"" Plugin key-mappings.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" vim-scripts/vim-auto-save
"" https://vimawesome.com/plugin/vim-auto-save
"" AutoSave current buffer
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 0  " do not display the auto-save notification
" InsertLeave, will save on every change in every time leave insert mode.
" CursorHold, will save every amount of milliseconds as defined in the updatetime option in normal mode.
let g:auto_save_events = ["InsertLeave", "CursorHold"]
"" augroup ft_markdown
""   au!
""   au FileType markdown let b:auto_save = 1  " only AutoSave to FileType markdown
"" augroup END

"" airblade/vim-gitgutter
let g:gitgutter_enabled = 1
set updatetime=1000
let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_async = 1
let g:gitgutter_terminal_reports_focus=0

"" autozimu/LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ }
nnoremap <F1> :call LanguageClient_contextMenu()<CR>

"" Include user's local vim config
if filereadable(expand("/home/opoel34/.config/nvim/init2.vim"))
  source /home/opoel34/.config/nvim/init2.vim
endif

