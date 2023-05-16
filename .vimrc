
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

" pep8 for every fileformat ?
set textwidth=0
set colorcolumn=80
highlight ColorColumn ctermbg=3
" Brown, DarkYellow combines with tmux colors
" see :help ctermbg for a list of colors that can be used in the terminal
"            NR-16   NR-8    COLOR NAME
"            0       0       Black
"            1       4       DarkBlue
"            2       2       DarkGreen
"            3       6       DarkCyan
"            4       1       DarkRed
"            5       5       DarkMagenta
"            6       3       Brown, DarkYellow
"            7       7       LightGray, LightGrey, Gray, Grey
"            8       0*      DarkGray, DarkGrey
"            9       4*      Blue, LightBlue
"            10      2*      Green, LightGreen
"            11      6*      Cyan, LightCyan
"            12      1*      Red, LightRed
"            13      5*      Magenta, LightMagenta
"            14      3*      Yellow, LightYellow
"            15      7*      White
"highlight ColorColumn guibg=Black
" make it black in Graphical Vims (my vim background is dark gray) 
" see help gui-colors for a list of suggseted color names
" see help guibg for how to specific specific rgb / hex colors

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
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
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode(ELSE)

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
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

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
" FOR LATER USE
" post install (yarn install | npm install) then load plugin only for editing supported files (assumes node and yarn|npm installed globally)
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install --frozen-lockfile --production',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
"Plug 'dense-analysis/ale'
"    let g:ale_fixers = {
"         \ ‘html’: [‘prettier’],
"         \ ‘css’: [‘stylelint’],
"         \}
"    let g:ale_linters = {
"         \ ‘html’: [‘htmlhint’],
"         \ ‘css’: [‘stylelint’],
"         \}
"    let g:ale_linters_explicit = 1
"    let g:ale_fix_on_save = 1

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

" tex
Plug 'lervag/vimtex'
    " disable some things
    let g:vimtex_indent_enabled   = 0
    let g:vimtex_imaps_enabled    = 0
    let g:vimtex_complete_enabled = 0
    let g:vimtex_syntax_enabled   = 0
    let g:vimtex_view_method = 'zathura'

" html, css, js
Plug 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
	let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}


call plug#end()
" -----

