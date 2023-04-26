" Basic
" -----

" vim only (not vi)
set nocompatible 

" encoding
set encoding=utf-8

" remove annoying bell sounds
set belloff=all

" no backup
set nobackup

" autosave
set autowrite

" when scrolling, do not let cursor above/below N lines
set scrolloff=10

" allow some parts to be hidden
set conceallevel=1

" show partial command
set showcmd

" show current mode
set showmode

" syntax highlighting
syntax enable

" filetype detection, plugins and indentation
filetype on
filetype indent on
filetype plugin on

" tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"searching
set hlsearch
set incsearch
set ignorecase
set smartcase



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
set statusline+=\ %F\ %M\ filetype:%Y\ %R
set statusline+=%=
set statusline+=\ %l,%c\ %p%%
set laststatus=2



" Cursor
" -----
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)



" Remappings
" -----
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap <Esc>u :nohls<CR>

let mapleader=" "
let maplocalleader = ","

map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>b :bprevious<CR>
map <leader>n :bnext<CR>
map <leader>sn :set number!<CR>
map <leader>srn :set relativenumber!<CR>
map <leader>scl :set cursorline!<CR>
map <leader>sp :set paste!<CR>:set paste?<CR>



" Python
" -----

"  filetype plugin?
"au Filetype python set
"    \ tabstop=4
"    \ softtabstop=4
"    \ shiftwidth=4
"    \ textwidth=79
"    \ expandtab
"    \ autoindent
"    \ fileformat=unix

"  % indicates the current file
au Filetype python nnoremap <F5> :w <CR>:!clear<CR>:!python3 % <CR>



" Plugins (with vim-plugins)
" -----
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
	nnoremap <C-p> :Files<CR>

Plug 'preservim/vimux'
    "map <Leader>vp :VimuxPromptCommand<CR>
    "map <Leader>vl :VimuxRunLastCommand<CR>
    "map <Leader>vi :VimuxInspectRunner<CR>
    "map <Leader>vq :VimuxCloseRunner<CR>
    "map <Leader>vx :VimuxInterruptRunner<CR>
    "map <Leader>vz :call VimuxZoomRunner()<CR>
    "map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>

Plug 'nanotee/zoxide.vim'

Plug 'christoomey/vim-tmux-navigator'
    noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
    noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
    noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
    noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

Plug 'lervag/vimtex'
    " syntax enable
    " <localleader>ll compile
    " <localleader>li info
    " <localleader>le errors
    let g:tex_flavor = 'latexmk'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_automatic = 1
    let g:vimtex_quickfix_mode = 0
    " making some things invisible when cursor not in line
    set conceallevel=1
    let g:tex_conceal = 'abdmg'

Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger       = '<Tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
" -----

colorscheme dracula
