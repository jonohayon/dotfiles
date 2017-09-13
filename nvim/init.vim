set nocompatible
filetype plugin indent on

set fileencoding=utf-8
set encoding=utf-8

set modelines=1

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim' " For da themese
Plug 'vim-airline/vim-airline' " For da shit
Plug 'vim-airline/vim-airline-themes' " For da shit's themes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " For da beloved sidebar
Plug 'scrooloose/syntastic' " For da linters
Plug 'majutsushi/tagbar', { 'on': 'Tagbar' } " For da navigation
Plug 'Tpope/vim-commentary' " For da commentz
Plug 'Valloric/MatchTagAlways' " Always match dem HTML tags
Plug 'mxw/vim-jsx' " Syntax highlighting for JSX aka React
Plug 'pangloss/vim-javascript' " Syntax highlighting for JS aka lyfe
Plug 'toyamarinyon/vim-swift' " Syntax highlighting for Swift aka love
Plug 'latex-box-team/latex-box' " The real deal for LaTeX in Vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'mattn/emmet-vim' " Emmet 4 vim
Plug 'airblade/vim-gitgutter' " GitGutter ayy
Plug 'raimondi/delimitmate' " Match dem qutes, parens etc.
Plug 'jeetsukumaran/vim-buffergator' " A nice window for switching buffers
Plug 'jistr/vim-nerdtree-tabs' " NERDTree + tabs
Plug 'mhinz/vim-startify' " Upping my start window game abit
Plug 'ryanoasis/vim-devicons' " NERDTree file iconz
Plug 'leafgarland/typescript-vim' " TypeScript syntax highlighting
Plug 'marciomazza/vim-brogrammer-theme' " Brogrammer theme
Plug 'dracula/vim' " Dracula theme
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file search
Plug 'jonohayon/todo-vim' " Todo comments manager
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " JavaScript support for deoplete
Plug 'zchee/deoplete-clang' " C Family support for deoplete
Plug 'mitsuse/autocomplete-swift' " Swift support for deoplete
Plug 'eagletmt/neco-ghc' " Haskell support for deoplete
Plug 'othree/jspc.vim' " Better parameter completion for JavaScript
Plug 'Shougo/neosnippet.vim' " Snippets support for deoplete
Plug 'Shougo/neosnippet-snippets' " Snippets for neosnippet
Plug 'cespare/vim-toml' " TOML syntax highlighting
Plug 'arrufat/vala.vim' " Vala stuff
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

" VimR (gui) settings
if has('gui_running')
  set lines=999 columns=999
endif

" Syntax highlighting and linters
let g:syntastic_javascript_checkers = ['standard', 'eslint']

" Search
set incsearch
set showmatch
set smartcase
set ignorecase
set hlsearch
set gdefault

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
" fzf
map <D-f> :FZF<CR>
" Todo comments panel
map <C-t> :TODOToggle<CR>
" Buffer window
map <C-x> :BuffergatorToggle<CR>

" Hebrew writing (mainly for LaTeX)
map <D-h> :set invhk inrl<CR>

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Neosnippet configuration
imap <expr><TAB> neosnippet#expandable_or_jumpable()
  \ ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : pumvisible() ? "\<C-n>" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable()
  \ ? "\<Plug>(neosnippet_expand_or_jump)"
  \ : "\<TAB>"

" TernJS config
let g:tern#filetypes = ['jsx', 'javascript.jsx', 'vue']

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
" colorscheme brogrammer
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

