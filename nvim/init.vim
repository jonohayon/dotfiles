set nocompatible
filetype plugin indent on

set fileencoding=utf-8
set encoding=utf-8

set modelines=1

" Plugins
call plug#begin('~/.vim/plugged')
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " Language Server Protocol client for neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Langauge Server Protocol client for neovim, better than LC-NVIM
Plug 'chriskempson/base16-vim' " For da themese
Plug 'vim-airline/vim-airline' " For da shit
Plug 'vim-airline/vim-airline-themes' " For da shit's themes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " For da beloved sidebar
Plug 'w0rp/ale' " For da linters
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' } " For da navigation
Plug 'tpope/vim-commentary' " For da commentz
Plug 'Valloric/MatchTagAlways' " Always match dem HTML tags
Plug 'mxw/vim-jsx' " Syntax highlighting for JSX aka React
Plug 'pangloss/vim-javascript' " Syntax highlighting for JS aka lyfe
Plug 'toyamarinyon/vim-swift' " Syntax highlighting for Swift aka love
Plug 'latex-box-team/latex-box' " The real deal for LaTeX in Vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'mattn/emmet-vim' " Emmet 4 vim
Plug 'airblade/vim-gitgutter' " GitGutter ayy
Plug 'raimondi/delimitmate' " Match dem qutes, parens etc.
Plug 'jistr/vim-nerdtree-tabs' " NERDTree + tabs
Plug 'mhinz/vim-startify' " Upping my start window game abit
Plug 'ryanoasis/vim-devicons' " NERDTree file iconz
Plug 'leafgarland/typescript-vim' " TypeScript syntax highlighting
Plug 'marciomazza/vim-brogrammer-theme' " Brogrammer theme
Plug 'dracula/vim' " Dracula theme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file search
Plug 'junegunn/fzf.vim' " fzf companion Vim functions
Plug 'jonohayon/todo-vim' " Todo comments manager
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " JavaScript support for deoplete
Plug 'tweekmonster/deoplete-clang2' " C Family support for deoplete
Plug 'mitsuse/autocomplete-swift' " Swift support for deoplete
Plug 'eagletmt/neco-ghc' " Haskell support for deoplete
Plug 'othree/jspc.vim' " Better parameter completion for JavaScript
Plug 'fatih/vim-go' " Go stuff
Plug 'posva/vim-vue' " Vue.js
Plug 'dart-lang/dart-vim-plugin' " Dart language support
Plug 'flowtype/vim-flow'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'sudar/vim-arduino-syntax'
Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do':  'make fsautocomplete' } " F# Language Support
Plug 'rizzatti/dash.vim'
Plug 'rust-lang/rust.vim' " Rust language support
call plug#end()

" Editor shit
set number
set linebreak
set scrolloff=6
set backspace=indent,eol,start
set autoread
set showcmd
set lazyredraw
set wildmenu
set wildmode=full
set laststatus=2
set timeout
set timeoutlen=1000
set ttimeoutlen=50
set noswapfile
set ruler
set colorcolumn=160
set hidden

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Syntax highlighting and linters
let g:syntastic_javascript_checkers = ['standard', 'eslint']
let g:syntastic_typescript_checkers = ['standard', 'eslint']

" Search
set incsearch
set showmatch
set smartcase
set ignorecase
set hlsearch
set gdefault
set inccommand=split

" Todo window
let g:todo_vertical = 1
let g:todo_right = 1
let g:todo_winwidth = 30

" Mappings

" Open sidebar - NERDTree
map <C-b> :NERDTreeToggle %:p:h<CR>
" Not used a ton - source the current file and install plugins (cuz vimrc is bae)
map <F8> :source %<CR>:PlugInstall<CR>
" Toggle comment on current line
map <D-_> gcc
" Tagbar shortcut
map <D-g> :Tagbar<CR>
" fzf in folder
map <D-f> :FZF<CR>
" Todo comments panel
map <C-t> :TODOToggle<CR>
" Buffer window
map <C-x> :BuffergatorToggle<CR>

" Hebrew writing (mainly for LaTeX)
map <D-h> :set invhk inrl<CR>

" fzf in files; taken from https://mkaz.blog/code/unix-is-my-ide/
map <C-f> :Find<space>
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Add tab
nmap <A-t> ^i<TAB><ESC>``

" LSP
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_serverCommands = {
"   \ 'javascript': ['javascript-typescript-stdio'],
"   \ 'javascript.jsx': ['javascript-typescript-stdio'],
"   \ 'typescript': ['javascript-typescript-stdio'],
"   \ 'typescript.tsx': ['javascript-typescript-stdio'],
"   \ 'html': ['html-languageserver', '--stdio'],
"   \ 'json': ['json-language-server', '--stdio'],
"   \ 'python': ['pyls']
"   \ }
"  let g:LanguageClient_diagnosticsDisplay = {
"       \    1: {
"       \         "name": "Error",
"       \         "texthl": "LChl",
"       \         "signText": "?",
"       \         "signTexthl": "LChl",
"       \     },
"       \     2: {
"       \         "name": "Warning",
"       \         "texthl": "LChl",
"       \         "signText": "?",
"       \         "signTexthl": "LChl",
"       \     },
"       \     3: {
"       \         "name": "Information",
"       \         "texthl": "LChl",
"       \         "signText": "?",
"       \         "signTexthl": "LChl",
"       \     },
"       \     4: {
"       \         "name": "Hint",
"       \         "texthl": "LChl",
"       \         "signText": "?",
"       \         "signTexthl": "LChl",
"       \     },
"       \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gR :call LanguageClient#textDocument_rename()<CR>
" autocmd FileType javascript setlocal omnifunc=LanguageClient#complete

" coc.nvim
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <A-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> gf <Plug>(coc-fix-current)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')

set statusline^=%{coc#status()}

autocmd FileType json syntax match Comment +\/\/.\+$+

" Flow
let g:flow#autoclose = 1

" Swift autocomplete config
autocmd FileType swift imap <buffer> <C-x> <Plug>(autocomplete_swift_jump_to_placeholder)

" Disabling arrow keys in both insert and normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Colorz and theme action
set termguicolors
let base16colorspace = 256
set background=dark
colorscheme dracula
syntax on

" Airline Config
let g:airline_theme = 'deus' " Looks good w/ brogrammer
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Tabs aka spaces
set autoindent
set smartindent
set expandtab " ONLY SPACES HOMIE
set shiftround

" 2 SPACES AYYY
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Open .eslintrc as JSON
au BufReadPost .eslintrc set syntax=json

" Open .tern-project and .tern-config as JSON
au BufReadPost .tern-project set syntax=json
au BufReadPost .tern-config set syntax=json

" Ale config - from Leeor
let g:ale_linters = {
   \   'haskell': ['stack-ghc-mod', 'hlint', 'hdevtools', 'hfmt'],
   \   'javascript': ['flow', 'eslint'],
   \}
let g:ale_fixers = {}
let g:ale_fixers.haskell = [{buffer -> {'command': 'hindent'}}]
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error='X'
let g:ale_sign_warning='!'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
