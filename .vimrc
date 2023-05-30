
" general
set encoding=utf-8
set belloff=all
set autowrite
set nobackup
set nowritebackup
set showcmd
set showmode
set autoread
set scrolloff=10
filetype on
filetype indent on
filetype plugin on
syntax enable

set textwidth=0
"set textwidth=80
"set colorcolumn=80
"highlight ColorColumn ctermbg=3

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set backspace=indent,eol,start
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" tab
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.pyc
set wildignore+=**/.git/*

" cursor
"let &t_SI.="\e[5 q" "SI = INSERT mode
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode(ELSE)

" make the switch between insert and normal mode faster 
set ttyfast
set ttimeout
set ttimeoutlen=1
set lazyredraw
" don't understand it
"set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.

" no statusline, ruler instead
set laststatus=0
set ruler
set rulerformat=%40(%=%<%f%m%r\ \
                      \ \ \
                      \ \ %l,%c\ \ %P%)

" Remappings
" -----
nnoremap <Esc>u :nohls<CR>
"nnoremap j gj
"nnoremap k gk
"nnoremap 0 g0
"nnoremap $ g$

let mapleader=" "
let maplocalleader = ","

" toggling
map <leader>sn :set number!<CR>
map <leader>srn :set relativenumber!<CR>
map <leader>scl :set cursorline!<CR>
map <leader>sp :set paste!<CR>:set paste?<CR>


" Plugins (with vim-plugins)
" -----
call plug#begin()

" all
Plug 'christoomey/vim-tmux-navigator'
    noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
    noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
    noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
    noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'yuttie/comfortable-motion.vim'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger       = '<Tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" md
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_conceal = 0
    "let g:vim_markdown_fenced_languages = ['csharp=cs']
    "Default is ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
    let g:vim_markdown_frontmatter = 1
    " Auto-write when following link
    let g:vim_markdown_autowrite = 1
    " disable new list indent
    let g:vim_markdown_new_list_item_indent = 0


" tex
Plug 'lervag/vimtex'
    " disable some things
    let g:vimtex_indent_enabled   = 0
    let g:vimtex_imaps_enabled    = 0
    let g:vimtex_complete_enabled = 0
    let g:vimtex_syntax_enabled   = 0
    let g:vimtex_view_method = 'zathura'
    " quickfix window is opened automatically when there are errors
    " but it does not become the active window
    let g:vimtex_quickfix_mode    = 2
    " quickfix window will close after this number of motions
    let g:vimtex_quickfix_autoclose_after_keystrokes = 1
 
    
    call plug#end()
" -----

