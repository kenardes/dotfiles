echo "Welcome, VEONIM"


" built-in plugin manager
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'


"" airblade/vim-gitgutter
" let g:gitgutter_enabled = 1
" set updatetime=100
" let g:gitgutter_highlight_lines = 0
" let g:gitgutter_map_keys = 0
" let g:gitgutter_async = 1
" let g:gitgutter_terminal_reports_focus=0


" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
  \'vscode.markdown-language-features',
  \'eamodio.gitlens',
\]


let g:vscode_config = {
  \'tsserver.trace.server': 'verbose',
  \'typescript.tsserver.trace': 'verbose'
\}


" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>


" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>


" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>


" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> <c-n> :Veonim next-problem<cr>
nno <silent> <c-p> :Veonim prev-problem<cr>

"" airblade/vim-gitgutter
let g:gitgutter_enabled = 1
set updatetime=100
let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_async = 1
let g:gitgutter_terminal_reports_focus=0

"" autozimu/LanguageClient-neovim
"" bash-language-server
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

" font
"set guifont=Monospace:h12
"set guifont=Fira\ Mono\ for\ Powerline:style=Medium:h12
set guifont=Fira\ Mono\ for\ Powerline:style=Medium:h12

"" themes
if has('nvim-0.1.5')
    set termguicolors
    colorscheme gruvbox
    set bg=dark
endif

