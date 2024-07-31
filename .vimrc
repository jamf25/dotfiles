syntax enable
" line numbers
set number relativenumber


" coloring and crosshair options
colorscheme elflord
set t_Co=256
set cursorcolumn
set cursorline
highlight CursorColumn cterm=NONE ctermbg=232 ctermfg=white guibg=#004040 guifg=white
highlight CursorLine cterm=NONE ctermbg=232 ctermfg=white guibg=#004040 guifg=white

" mods I'm not set on
" set mouse-=a
" noremap <C-[><Esc>
" set wildmode=longest,list,full
" set mapleader key
let mapleader=" "

" tab options  
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set paste
set hlsearch
set smartcase
set lazyredraw
set laststatus=2
set ruler

" folding options
" defaults for reference
" zf create and fold
" zo/zc open/close
" zM/zR  close/open all
" za toggle folding 

" highlight FoldColumn guibg=darkgrey guifg=white
" highlight Folded guifg=PeachPuff4
" methods: indent | synta | marker | expr
set nofoldenable
"autocmd yml setlocal foldmethod=indent
set foldmethod=indent
set foldnestmax=3
"set nofoldenable




set splitbelow splitright
" remaps
nnoremap <C-e> :!crf<Space>
nnoremap <C-t> :tabnew<Space>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-e> :18Lex<CR>
nnoremap <leader>a :set<Space>autoindent!<CR>
nnoremap <leader>n :set<Space>number!<Space>relativenumber!<CR>
nnoremap <C-h> :set nohlsearch!<CR>
nnoremap <leader>z :set foldenable!<CR>
" feeble attempt to use <cword> in remap
" nnoremap <leader>s /expand('<cword>')

" reference example
" https://vi.stackexchange.com/questions/16090/trouble-using-cword-in-mapping




" new window
nnoremap <leader>v :vnew<space>
" open file under cursor in window
nnoremap <leader>of <C-w><C-f>
" switch windows
nnoremap <leader>w <C-w>w
" remove trailing whitespace

" shorcut to find and replace
nnoremap S :%s//gI<Left><Left><Left>




"<BS>           Backspace
"<Tab>          Tab
"<CR>           Enter
"<Enter>        Enter
"<Return>       Enter
"<Esc>          Escape
"<Space>        Space
"<Up>           Up arrow
"<Down>         Down arrow
"<Left>         Left arrow
"<Right>        Right arrow
"<F1> - <F12>   Function keys 1 to 12
"#1, #2..#9,#0  Function keys F1 to F9, F10
"<Insert>       Insert
"<Del>          Delete
"<Home>         Home
"<End>          End
"<PageUp>       Page-Up
"<PageDown>     Page-Down
"<bar>          the '|' character, which otherwise needs to be escaped '\|'


call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sensible'
call plug#end()
