""" PLUGGINS
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Make sure you use single quotes
"""" Project Drawer
Plug 'Xuyuanp/nerdtree-git-plugin'                   " Show changed files in NERDTree
Plug 'jistr/vim-nerdtree-tabs'                       " Makes NERDTree awesome if you use tabs
Plug 'scrooloose/nerdtree'                           " Project drawer

""" BUFFER NAVIGATION / TEXT MANIPULATION
Plug 'christoomey/vim-tmux-navigator'                " Navigate with C-h/j/k/l in tmux and vim
Plug 'godlygeek/tabular'                             " Align code
Plug 'itspriddle/vim-stripper'                       " Strip trailing whitespace on save
Plug 'justincampbell/vim-eighties'                   " Ensures windows are at least 80 chars wide (my PR added the ability to ignore a list of additional bufnames)
Plug 'tpope/vim-endwise'                             " Auto adds end to method definitions, blocks, etc
Plug 'alvan/vim-closetag'                            " Automatically close an html tag when you type the opening of it
Plug 'rstacruz/vim-closer'                           " Like auto-pairs, but more conservative, only adds the closing when you press enter
Plug 'terryma/vim-multiple-cursors'                  " like sublime multiple cursors
Plug 'scrooloose/nerdcommenter'                      " Comment multiple lines

" Initialize plugin system
"""" RUBY
Plug 'thoughtbot/vim-rspec'                          " thoughtbot vim-rspec send to tmux, vim-dispatch, etc

"""" RUBY
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'onemanstartup/vim-slim'                        " Slim template syntax highlighting
Plug 'tpope/vim-haml'                                " Enabled .haml extension

"""" YAML
Plug 'avakhov/vim-yaml'                              " Yaml stuff

"""" JAVASCRIPT
""""" BASE
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'isRuslan/vim-es6'                              " es-6 help

""""" FLAVORS
" Plug 'leafgarland/typescript-vim'
" Plug 'glanotte/vim-jasmine'

""""" ELIXIR
" Plug 'elixir-editors/vim-elixir'
" Plug 'mhinz/vim-mix-format'
" Plug 'slashmili/alchemist.vim'

"""" VUE
Plug 'posva/vim-vue'

""" TESTING
Plug 'benmills/vimux'                               " send to tmux pane
Plug 'jgdavey/vim-turbux'                           " send to tmux pane
Plug 'janko-m/vim-test'                              " Test runner
Plug 'jondkinney/rspec.vim'                          " RSpec syntax highlighting improvements

""" Ember
Plug 'mustache/vim-mustache-handlebars'

""" Git
Plug 'tpope/vim-fugitive'
Plug 'ellisonleao/gruvbox.nvim'

call plug#end()

set background = "dark"
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

let mapleader = ','
set number

""" NERDTREE
" Open NERDTree with [<leader>d]
map <Leader>d :NERDTreeMirrorToggle<CR>
" Show current file in the NERDTree hierarchy
map <Leader>D :NERDTreeFind<CR>
map <Leader>n :NERDTreeToggle<CR>

let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeWinSize = 40
let NERDTreeShowLineNumbers=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=2
" list of file types I don't want to auto-open nerdtree for
autocmd FileType vim,tmux,gitcommit,gitconfig,gitrebase let g:nerdtree_tabs_open_on_console_startup=0
autocmd BufNewFile,BufRead vundle let g:nerdtree_tabs_open_on_console_startup=0

let NERDSpaceDelims=1 " For nerdcommenter, add one space after comment char

" split rightward so as not to displace a left NERDTree
let g:ack_mappings = {
      \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
      \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J',
      \ '<cr>': ':NERDTreeMirrorToggle<CR><CR>:NERDTreeMirrorToggle<CR><C-W>l' }

" nnoremap ,em :NERDTreeMirrorToggle<CR>:OpenChangedFiles<CR>:NERDTreeMirrorToggle<CR>
nnoremap ,em :OpenChangedFiles<CR>

"""FUZZYFIND
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

""" Save files with SS
noremap SS :w<CR>
inoremap SS <Esc>:w<CR>

""" Tab stuff
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2

let g:vue_disable_pre_processors = 1

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set nohidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall
set clipboard=unnamed
let g:markdown_folding = 1

"""" vim-rspec & cucumber test runner mappings <leader>T
let VimuxHeight = "33" "this is percentage
let VimuxOrientation = "h"
let VimuxUseNearestPane = 1

let g:turbux_command_prefix = 'clear;'

nmap <leader>t <Plug>SendTestToTmux
nmap <leader>T <Plug>SendFocusedTestToTmux

" for rspec.vim (syntax highlighting enhancements for rspec)
autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:40%:hidden')
  \           : fzf#vim#with_preview('right:50%'),
  \   <bang>0)
nnoremap <C-p> :Rg<space>'' -g '**/*'<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
