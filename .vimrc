
set encoding=utf-8
set belloff=all
set autowrite
set nobackup
set nowritebackup
set showcmd
set showmode
set autoread
set scrolloff=10

" filetype detection, plugins and indentation
filetype on
filetype indent on
filetype plugin on

" syntax highlighting
syntax enable

" sane editing
set textwidth=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

"searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.pyc
set wildignore+=**/.git/*




" Cursor
" -----
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode(ELSE)
" make the switch between insert and normal mode faster 
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set lazyredraw




" Statusline
" -----
"no statusline, ruler instead
set laststatus=0
set ruler
set rulerformat=%40(%=%<%f%m%r\ \
                      \ \ \
                      \ \ %l,%c\ \ %P%)





" Remappings
" -----

" similar to less
nnoremap <Esc>u :nohls<CR>

" for wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

" leader and localleader
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

Plug 'christoomey/vim-tmux-navigator'
    noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
    noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
    noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
    noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'yuttie/comfortable-motion.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
	nnoremap <leader>b :Buffers<CR>
	nnoremap <leader>f :Files<CR>
	nnoremap <leader>g :GFiles<CR>

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger       = '<Tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

Plug 'lervag/vimtex'
    " disable some things
    let g:vimtex_indent_enabled   = 0
    let g:vimtex_imaps_enabled    = 0
    let g:vimtex_complete_enabled = 0
    let g:vimtex_syntax_enabled   = 0
    let g:vimtex_view_method = 'zathura'

call plug#end()
" -----

