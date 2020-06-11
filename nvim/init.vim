"                                 ___
"        ___        ___          /__/\
"       /__/\      /  /\        |  |::\
"       \  \:\    /  /:/        |  |:|:\
"        \  \:\  /__/::\      __|__|:|\:\
"    ___  \__\:\ \__\/\:\__  /__/::::| \:\
"   /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
"   \  \:\|  |:|     \__\::/  \  \:\
"    \  \:\__|:|     /__/:/    \  \:\
"     \__\::::/      \__\/      \  \:\
"         ~~~~                   \__\/
"
"    Collector - by me (Mono)

" ===========> Specify the plugins you want to install down here.
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'nlknguyen/papercolor-theme'
Plug 'srcery-colors/srcery-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin on

" ===========> Custom configs
" Set theme
set background=light
colorscheme PaperColor
let g:srcery_italic = 1
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
hi Comment guifg=#A9A9A9 gui=italic
hi CursorLine guibg=#708090 guifg=#FFFFFF
hi Visual guibg=#708090 guifg=#FFFFFF
set termguicolors
set t_Co=256
set cmdheight=2
set signcolumn=yes
" Always show current position
set ruler
" Turn on syntax highlighting.
syntax on
" Encoding
set encoding=utf-8
set fileencoding=utf-8
" Mouse
set mouse=a
" Line numbers
set number
set noshowmode
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" ===========> Remap Keys
" Remap for escape
:imap ii <Esc>

" Switching between tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" Yank/Paste between files
vnoremap <C-c> "+y
map <C-P> "+p

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" ==> coc hotkeys
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>f :Format<CR>
nmap <leader>l :CocList diagnostics<CR>
" GoTo code navigation.

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>bo :BufOnly<CR>
xmap <leader>f  <Plug>(coc-format-selected)
" Use K to show documentation in preview window.

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    > tree
""""""""""""""""""
map <C-x> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeMapOpenInTab='t'
let NERDTreeQuitOnOpen=1

""""""""""""""""""
"    > commenter
""""""""""""""""""
let NERDDefaultAlign="left"
let NERDSpaceDelims=1
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
     \ 'coc-prettier',
     \ 'coc-eslint',
     \ 'coc-emmet',
     \ 'coc-highlight',
     \ 'coc-tsserver',
     \ 'coc-html',
     \ 'coc-json',
     \ 'coc-markdownlint',
     \ 'coc-css',
     \ 'coc-solargraph',
     \]
