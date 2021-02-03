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
Plug 'wakatime/vim-wakatime'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ronakg/quickr-preview.vim'
call plug#end()

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

" indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" allow recrusive sub-folder search 
set path+=**

silent! colorscheme vim-monokai-tasty

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

let g:quickr_preview_keymaps = 0
let g:quickr_preview_position = 'above'
let g:quickr_preview_on_cursor = 1
let g:quickr_preview_exit_on_enter = 1

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
inoremap jk <Esc>

nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)

""""""""""""""""""""""""""
" file explorer settings "
""""""""""""""""""""""""""

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_browse_split=4
