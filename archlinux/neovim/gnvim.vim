echo "Welcome, GNVIM"

" font
"set guifont=Monospace:h10
set guifont=Fira\ Mono\ for\ Powerline:style=Medium:h9

"" airblade/vim-gitgutter
let g:gitgutter_enabled = 1
set updatetime=100
let g:gitgutter_highlight_lines = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_async = 1
let g:gitgutter_terminal_reports_focus=0

"" autozimu/LanguageClient-neovim
"" bash-language-server
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

"" themes
if has('nvim-0.1.5')
    set termguicolors
    colorscheme gruvbox
    set bg=dark
endif
