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
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

"" Plugin
filetype plugin indent on

"" Theme
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax enable
set background=dark
colorscheme onedark
let g:onedark_termcolors=256

"" Backup
set directory=/tmp/backup
set backupdir=$XDG_CONFIG_HOME/nvim/backup

"" Langage
if has("multi_lang")
    language C
endif

"" pyenv
let g:python_host_prog = expand('$HOME') . '/.pyenv/shims/python2'
let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python'

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

"" Unite.vim
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1
let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

nnoremap [unite] <Nop>
nmap <Leader>f [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]p :<C-u>Unite<Space>file_point<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory/new<CR>
nnoremap <silent> [unite]n :<C-u>Unite<Space>file/new<CR>
nnoremap <silent> [unite]v :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

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
