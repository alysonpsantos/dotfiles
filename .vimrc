
" General
" -----

"set nocompatible
set encoding=utf-8
set belloff=all
set autowrite

" Some servers have issues with backup files
set nobackup
set nowritebackup

" when scrolling, do not let cursor above/below N lines
set scrolloff=10

" allow some parts to be hidden
set conceallevel=1

" show partial command
set showcmd

" show current mode
set showmode

" filetype detection, plugins and indentation
filetype on
filetype indent on
filetype plugin on

" syntax highlighting
syntax enable

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

"searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Shows an exhaustive list during tab completion
set wildmenu
set wildmode=longest,list,full
" Ignore files
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


" Status line
" -----
"  %f - Path to the file in the buffer, as typed or relative
"  %F - Full path to the file in the buffer
"  %M - Modified flag shows if file is unsaved
"  %Y - Type of file in the buffer
"  %R - displays the read-only flag
"  %l - display the row number
"  %c - display the column number
"  %p%% - show the cursor from the top of the file
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ %l,%c\ %p%%
" or
"set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
" always display the status bar
set laststatus=2


" Remappings
" -----

" easier escape
imap jk <Esc>
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

" tmux
Plug 'christoomey/vim-tmux-navigator'
    noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
    noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
    noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
    noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

" comfortable motion
Plug 'yuttie/comfortable-motion.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
	nnoremap <leader>b :Buffers<CR>
	nnoremap <leader>f :Files<CR>
	nnoremap <leader>g :GFiles<CR>

" snippets
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger       = '<Tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

call plug#end()
" -----

