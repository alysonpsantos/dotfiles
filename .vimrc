" general
set encoding=utf-8
set belloff=all
set scrolloff=999
set nobackup
set nowritebackup
set autoread
set autowrite
set showcmd
set showmode

" filetype
filetype on
filetype indent on
filetype plugin on
syntax enable

" no wrap
set textwidth=0

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
" turn on and off 'hlsearch' with autocmd
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" tab
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.pyc
set wildignore+=**/.git/*

" make the switch between insert and normal mode faster 
set ttyfast
set ttimeout
set ttimeoutlen=1
set lazyredraw

" no statusline, ruler instead
set laststatus=0
set ruler
set rulerformat=%40(%=%<%f%m%r\ \
                      \ \ \
                      \ \ %l,%c\ \ %P%)

" Remappings
" -----

let mapleader=" "
let maplocalleader = ","

nnoremap <Esc>u :nohls<CR>
nnoremap <leader>sn :set number!<CR>
nnoremap <leader>srn :set relativenumber!<CR>
nnoremap <leader>scl :set cursorline!<CR>
nnoremap <leader>sp :set paste!<CR>:set paste?<CR>


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
    " problem when typing â
    "References
    "https://stackoverflow.com/questions/20335393/accents-in-vim-cannot-write-%C3%A2
    "https://github.com/jiangmiao/auto-pairs/issues/88
    let g:AutoPairsShortcutBackInsert=''
    let g:AutoPairsShortcutJump=''
    let g:AutoPairsMoveCharacter=''
Plug 'tpope/vim-surround'
Plug 'yuttie/comfortable-motion.vim'
    "Scroll with Ctrl-d and Ctrl-u
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

