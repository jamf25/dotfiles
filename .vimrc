"syntax enable
" line numbers
set number relativenumber


"" coloring and crosshair options
colorscheme elflord
set t_Co=256
set cursorcolumn
set cursorline
highlight CursorColumn cterm=NONE ctermbg=232 ctermfg=white guibg=#004040 guifg=white
highlight CursorLine cterm=NONE ctermbg=232 ctermfg=white guibg=#004040 guifg=white

" mods I'm not set on
" set mouse-=a
" noremap <C-[><Esc>
" set mapleader key
let mapleader=" "

" tab options  
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
"set paste
set hlsearch
set smartcase
set lazyredraw
set laststatus=2
set ruler
set shortmess+=c
set complete=.,w,b,u,t,i,kspell
set wildmode=longest,list,full
set completeopt=menuone,longest

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
""autocmd yml setlocal foldmethod=indent
set foldmethod=indent
""set foldmethod=marker
set foldnestmax=3
set splitbelow splitright
"set termguicolors
" ultisnip maps
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.



"let g:UltiSnipsSnippetDirectories="$(HOME)/.vim/plugged/"
packadd vimcomplete


" remaps

nnoremap <C-e> :!crf<Space>
nnoremap <C-q> :tabnew<Space>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-h> :set nohlsearch!<CR>
nnoremap <C-e> :18Lex<CR>

" leader remaps
nnoremap <leader>a :set<Space>autoindent!<CR>
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>n :set<Space>number!<Space>relativenumber!<CR>
nnoremap <leader>z :set foldenable!<CR>
" FZF remaps
nnoremap <leader>o :Files<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>
" new window
nnoremap <leader>v :vnew<space>
" open file under cursor in window
nnoremap <leader>of <C-w><C-f>
" switch windows
nnoremap <leader>w <C-w>w
" remove trailing whitespace
" feeble attempt to use <cword> in remap
" nnoremap <leader>s /expand('<cword>')

" reference example
" https://vi.stackexchange.com/questions/16090/trouble-using-cword-in-mapping
" shorcut to find and replace
nnoremap S :%s//gI<Left><Left><Left>




call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-commentary'
Plug 'unblevable/quick-scope'
"Plug 'jayli/vim-easycomplete'
"Plug 'girishji/vimcomplete'
call plug#end()

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <cr>    pumvisible() ? "<C-y>" : "<cr>"


highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=7 ctermbg=52 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=3 ctermbg=19 cterm=underline
"augroup qs_colors
"  autocmd!
"  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=7 ctermbg=52 cterm=underline
"  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=3 ctermbg=33 cterm=underline
"augroup END
