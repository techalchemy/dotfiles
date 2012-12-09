set nocompatible
call pathogen#infect()      " add pathogen to vimrc/get all bundles
call pathogen#helptags()    " Load helptags

filetype off
filetype plugin indent on
syntax on
let python_highlight_all = 1

" Auto commands
" ==============
au BufWrite *.py %retab     " Re-tab python files on write
au BufRead,BufNewFile *.py set expandtab
set omnifunc=pythoncomplete#Complete
" Auto-load NerdTree if loading vim with no files
autocmd vimenter * if !argc() | NERDTree | endif
" Remember previous position and jump to it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" General Options
" =================
let mapleader = ","         " Rebinds <Leader>
set encoding=utf-8
set termencoding=utf-8
set lazyredraw
set visualbell
set showmode
set wildmode=list:longest   " Tab shows completion options like in shell
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set nocompatible            " Disable legacy vi compatibility
set showcmd                 " Show incomplete commands
set autoread                " Reload modified files
set mouse=a
set autoindent
set copyindent
" set backspace=indent,eol,start
set bs=2                    " Make backspace act normal

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Yank will copy to the system global clipboard
set clipboard=unnamed

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" disable formatting of large pasted text chunks (prevent extra tabbing)
set pastetoggle=<F2>

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap                  " Don't automatically wrap on load
set tw=79                   " Document width used by gd
set fo-=t                   " Don't auto-wrap when typing
set number

set showmatch       " Show matching brackets.
set hidden             " Hide buffers when they are abandoned
set ruler           " Always show cursor position

set completeopt=menuone,longest,preview

" Mappings
" =========
noremap <F3> :NumbersToggle<CR>     " Toggle line numbers
noremap <F4> :NERDTreeToggle<CR>    " Use nerdtree
noremap <F5> :GundoToggle<CR>      " Map f5 to gundo
nmap <F8> :TagbarToggle<CR>        " Toggle the tagbar
noremap <F9> :Gcommit<CR>         " Gcommit mapped


" Settings for python-mode
" =========================
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:SuperTabDefaultCompletionType = "context"
set foldenable
set foldlevelstart=99
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Settings for vim-powerline
" ===========================
set laststatus=2
" let g:Powerline_symbols = 'fancy'


" Settings for vim-markdown
" ==========================
set nofoldenable


" Settings for ctrlp
" ===================
" let g:ctrlp_max_height = 30


" Movement
" =========
" make Ctrl+movement key move windows, rather than ctrl+w + movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>n esc:tabprevious<CR>
map <Leader>m esc:tabnext<CR>


" Fixing copy and paste
" ======================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a


" Color Scheme
" =============
set t_Co=256
" colorscheme tomorrow_night
set background=dark
""let g:jellybeans_use_lowcolor_black=1
let g:molokai_original=0
let g:solarized_termcolors=256
colorscheme molokai

set colorcolumn=81
set cursorline                  " Show horiz. cursor line
