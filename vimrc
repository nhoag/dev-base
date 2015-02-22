execute pathogen#infect()
execute pathogen#helptags()

syntax on
colorscheme elflord

let g:airline_theme='molokai'

let mapleader = '\'
filetype off
filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>

set ignorecase
set smartcase
set gdefault
set showmatch
set tabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
set noshowmode
set nocompatible
set background=dark
cnoremap sudow w !sudo tee % >/dev/null
nnoremap <leader>w :w<CR>
set softtabstop=2
set number
set noswapfile
nnoremap <leader>f :Ag<CR>
nnoremap <leader>p :set paste<CR>
nnoremap <leader>o :set nopaste<CR>
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey guibg=DarkGrey

if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

nmap <leader>l :set list!<CR>
nnoremap <silent> <leader>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
