"------------------------------
""vim settings
"------------------------------
" dein.vim
if &compatible
    set nocompatible
endif

let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') :$XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

let s:dein_cache_dir = g:cache_home . '/dein'

augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/nvim/dein'

    call dein#load_toml(s:toml_dir . '/plugins.toml',  {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    if has('nvim')
        call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 0})
    endif
    if !has('nvim')
        call dein#load_toml(s:toml_dir . '/vim.toml', {'lazy': 0})
    endif
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

"" Plugin
filetype plugin indent on

"" Theme
syntax enable
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
colorscheme onedark
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

"" Backup
set directory=/tmp/backup
set backupdir=$XDG_CONFIG_HOME/nvim/backup

"" Langage
if has("multi_lang")
    language C
endif

"" pyenv
let g:python_host_prog = expand('$PYENV_ROOT') . '/shims/python2'
let g:python3_host_prog = expand('$PYENV_ROOT') . '/shims/python'

"" Shell
if has('nvim')
    set sh=zsh
    tnoremap <silent> <ESC> <C-\><C-n>
endif
"" Setting
set encoding=utf-8
set clipboard=unnamed,unnamedplus
set wrap
set hidden

set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan

set autoindent
set backspace=indent,eol,start

set ruler
set number
set list
set wildmenu
set showcmd
set showmatch

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

"" KeyMap
let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"
nnoremap <Esc><Esc> :set nohlsearch<CR>
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap so <C-w>_<C-w>|
nnoremap s= <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap tr :NERDTreeToggle<CR>
nnoremap ya ggvG$y
nnoremap co :%s/./&/g<CR>

"" Indent_Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=green
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 2

"" Denite.nvim
if has('nvim')
    nnoremap [denite] <Nop>
    nmap <Leader>f [denite]
    nnoremap <silent> [denite]t :<C-u>Denite<Space>filetype<CR>
    nnoremap <silent> [denite]f :<C-u>Denite<Space>file_rec<CR>
    nnoremap <silent> [denite]j :<C-u>Denite<Space>line<CR>
    nnoremap <silent> [denite]g :<C-u>Denite<Space>grep<CR>
    nnoremap <silent> [denite]] :<C-u>DeniteCursorWord grep<CR>
    nnoremap <silent> [denite]r :<C-u>Denite<Space>file_mru<CR>
    nnoremap <silent> [denite]p :<C-u>Denite<Space>file_point<CR>
    nnoremap <silent> [denite]h :<C-u>Denite<Space>neoyank<CR>
    nnoremap <silent> [denite]d :<C-u>Denite<Space>directory_rec<CR>
    nnoremap <silent> [denite]v :<C-u>DeniteBufferDir<Space>file_rec<CR>
endif

"" vim-fugitive
nmap [figitive] <Nop>
map <Leader>g [figitive]
nmap <silent> [figitive]s :<C-u>Gstatus<CR>
nmap <silent> [figitive]d :<C-u>Gdiff<CR>
nmap <silent> [figitive]b :<C-u>Gblame<CR>
nmap <silent> [figitive]l :<C-u>Glog<CR>

"" ale
" error mark
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" error message format
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
" open with lint
let g:ale_lint_on_enter = 1
" save with lint
let g:ale_lint_on_save = 1
" edit without lint
let g:ale_lint_on_text_changed = 'never'
" location list and quickfix without lint
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
" linter list
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['gofmt', 'goimports', 'golint'],
\}
" prefix
nmap [ale] <Nop>
map <C-k> [ale]
" keymap
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

"" quickrun
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}
let g:quickrun_config['markdown'] = {
    \ 'type': 'markdown/pandoc',
    \ 'cmdopt': '-s -f markdown_github -c ~/.pandoc/github.css',
    \ 'outputter': 'browser'
    \ }
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
