" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

"""""""""""
" plugins "
"""""""""""
call plug#begin('~/.vim/plug')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'tpope/vim-surround'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'neoclide/coc.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'simeji/winresizer' 
Plug 'moll/vim-bbye'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'vim-vdebug/vdebug'
call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-phpls', 'coc-html', 'coc-tsserver', 'coc-emmet', 'coc-highlight', 'coc-pairs', 'coc-css', 'coc-calc', 'coc-xml']

""""""""""
" module "
""""""""""
filetype on
filetype plugin on
filetype indent on
syntax on

"""""""""""""""""""""
" set some defaults "
"""""""""""""""""""""
set encoding=utf-8
set clipboard=unnamedplus
set number
set relativenumber
set hidden
set whichwrap+=h,l
set mouse=a
set wildmode=longest:full,full
set wildmenu
set undofile
set undodir=~/.vim/undo
set undolevels=10000
set splitright

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" allow recrusive sub-folder search 
set path+=**

silent! colorscheme vim-monokai-tasty


if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.break_on_open = 0
let g:vdebug_options.watch_window_style = 'compact'

"""""""""
" remap "
"""""""""

" tag jump handler
function! Jump_tag()
  :execute "ltag ".expand("<cword>")
  if len(getloclist(0)) > 1
    :lopen
  endif
endfunction

nnoremap à :call Jump_tag()<CR>

" insert mode
function! CleverTab(forward)
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      if a:forward
          return "\<C-N>"
      else
          return "\<C-P>"
      endif
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab(1)<CR>
inoremap <S-Tab> <C-R>=CleverTab(0)<CR>

nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)


noremap U :MundoToggle<CR>

let g:mundo_preview_bottom = 1
let g:mundo_right = 1

let g:dbs = {"tubs" : "mysql://jc:@localhost/tubs"}

""""""""""""""""""""""""""
" file explorer settings "
""""""""""""""""""""""""""

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_browse_split=4


