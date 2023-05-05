" Basic
" -----

" vim only (not vi)
set nocompatible 

set encoding=utf-8
set belloff=all
set autowrite
"set termguicolors

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

" syntax highlighting
syntax enable

" filetype detection, plugins and indentation
filetype on
filetype indent on
filetype plugin on

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
" buffer navigation
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>qq :qa<CR>
map <leader>h :bprevious<CR>
map <leader>l :bnext<CR>


" Python
" -----
"au Filetype python set colorcolumn = 80
au Filetype python nnoremap <F5> :w<CR>:!clear<CR>:!python3 %<CR>



" Plugins (with vim-plugins)
" -----
call plug#begin()

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' 
Plug 'airblade/vim-gitgutter'
   " Git fugitive mappings
    noremap <leader>gl :G log<CR>
    noremap <leader>gc :G commit<CR>
    noremap <leader>gp :G push<CR>
    " Equivalent to git status
    noremap <leader>gs :G <CR>
    "open github url on web browser
    noremap <leader>gb :GBrowse <CR>  

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
	nnoremap <leader>b :Buffers<CR>
	nnoremap <leader>f :Files<CR>
	nnoremap <leader>g :GFiles<CR>

" zoxide
Plug 'nanotee/zoxide.vim'
    " options to pass to fzf during interactive selection
    " same options as $_ZO_FZF_OPTS
	if exists('$_ZO_FZF_OPTS')
		let g:zoxide_fzf_options = $_ZO_FZF_OPTS
	endif

" nerdtree
Plug 'preservim/nerdtree'
    " Start NERDTree when Vim is started without file arguments.
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
    " thanks to miguelgrinsberg
    nnoremap <leader>n :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
    " use this variable to change symbols
    let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Modified'  :'✹',
        \ 'Staged'    :'✚',
        \ 'Untracked' :'✭',
        \ 'Renamed'   :'➜',
        \ 'Unmerged'  :'═',
        \ 'Deleted'   :'✖',
        \ 'Dirty'     :'✗',
        \ 'Ignored'   :'☒',
        \ 'Clean'     :'✔︎',
        \ 'Unknown'   :'?',
        \ }
    " nerdfonts not installed
    let g:NERDTreeGitStatusUseNerdFonts = 0
    " show ignored status
    let g:NERDTreeGitStatusShowIgnored = 1 

" snippets
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger       = '<Tab>'
    let g:UltiSnipsJumpForwardTrigger  = '<Tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" latex
Plug 'lervag/vimtex'
    " syntax enable
    let g:tex_flavor = 'latexmk'
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_automatic = 1
    let g:vimtex_quickfix_mode = 0
    " set conceallevel=1
    let g:tex_conceal = 'abdmg'

" python
Plug 'jmcantrell/vim-virtualenv'

" comfortable motion
Plug 'yuttie/comfortable-motion.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
    noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
    noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
    noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
    noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
    noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

"Plug 'nordtheme/vim'
"colorscheme nord

call plug#end()
" -----

