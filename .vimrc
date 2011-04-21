"
" ~/.vimrc
"

set all&                   " restore defaults; ignore global vimrc

set background=dark        " use light-on-dark color scheme

set shortmess=I            " do not show intro
set laststatus=2           " always show status line
set showtabline=2          " always show tab line

set nowrap                 " do not wrap long lines
set sidescroll=1           " scroll horizontally in 1 column increments

set splitbelow             " put new split windows on the bottom
set splitright             " put new vsplit windows on the right

set shiftwidth=4           " indent/unindent by 4 spaces
set softtabstop=4          " tab/backspace use 4 spaces
set expandtab              " expand tabs to spaces
set autoindent             " keep new-line indentation at same level

set incsearch              " search as you type
set hlsearch               " highlight search matches
set ignorecase             " case-insensitive search
set smartcase              " case-heuristic search

set showmatch              " highlight matching brackets
set whichwrap=s,b,<,>,[,]  " space, backspace and arrows can cross newlines
set pastetoggle=<Insert>   " insert toggles paste mode

set ttimeoutlen=100        " key-codes timeout after 100ms
set timeoutlen=2000        " key-mappings timeout after 2000ms

set wildmenu
set wildmode=longest:full,full

set backspace=indent,eol,start
set listchars=tab:>-,trail:-,precedes:<,extends:>
set statusline=\ %F%=[%Y%R%M][%02l:%02c][0x%02B][B%05o/%02p%%/%LL]

syntax on                  " use syntax highlighting
filetype plugin indent on  " detect file types

let g:netrw_keepdir=0      " cwd tracks file explorer
let g:netrw_liststyle=3    " tree-style file explorer

" Make Ctrl-t-* tab actions match Ctrl-w-* window actions
" Ctrl-t-n opens new tab
" Ctrl-t-w opens new tab of current window
" Ctrl-t-c closes current tab
" Ctrl-t-o closes other tabs
" Ctrl-t-(Left|Right) navigates tabs
" Ctrl-Page(Up|Down) navigates tabs by default
nmap <C-t>  <NOP>
nmap <C-t>n :tabnew<CR>
nmap <C-t>w <C-w>T
nmap <C-t>c :tabclose<CR>
nmap <C-t>o :tabonly<CR>
nmap <C-t><Left>  :tabprevious<CR>
nmap <C-t><Right> :tabnext<CR>

" Ctrl-e opens file explorer
nmap <C-e> :Explore<CR>

" Ctrl-(Up|Down) scrolls the buffer in the window
nnoremap <C-Up>   <C-Y>
nnoremap <C-Down> <C-E>

" Enter goes to the tag under cursor
" Backspace goes to the previous tag
" Ctrl-f searches for a tag
nmap <CR>  g<C-]>
nmap <BS>  :pop<CR>
nmap <C-f> :tjump<SPACE>

" Ctrl-u lists the undo-branches
nmap <C-u> :undolist<CR>

" Ctrl-h toggles search result highlighting
nmap <C-h> :set hlsearch! hlsearch?<CR>

" Ctrl-p toggles non-printable characters
nmap <C-p> :set list! list?<CR>

" Ctrl-_ toggles cursor line highlighting
nmap <C-_> :set cursorline! cursorline?<CR>

" Restore physical terminal type (see zshrc)
if exists("$_TERM")
    set term=$_TERM
endif

" Map common Ctrl keys for TERM=rxvt
if &term =~ "rxvt"
    map ^[Oa  <C-Up>
    map ^[Ob  <C-Down>
    map ^[Oc  <C-Right>
    map ^[Od  <C-Left>
    map ^[[2^ <C-Insert>
    map ^[[3^ <C-Delete>
    map ^[[7^ <C-Home>
    map ^[[8^ <C-End>
    map ^[[5^ <C-PageUp>
    map ^[[6^ <C-PageDown>
endif

" Tab-Completion
function! SmartTab()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    elseif strlen(&omnifunc) > 0
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=SmartTab()<CR>

" XHTML
autocmd FileType xhtml set softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.xhtml set filetype=xhtml

autocmd FileType ruby set tabstop=2 shiftwidth=2
