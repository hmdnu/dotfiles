let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 300

call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'morhetz/gruvbox'
Plug 'jlanzarotta/bufexplorer'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

set number
set relativenumber
set history=1000       
set encoding=utf-8      
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" LSP jump to warn or err
nnoremap ]d <Plug>(lsp-next-diagnostic)
nnoremap [d <Plug>(lsp-previous-diagnostic)
nnoremap ]e <Plug>(lsp-next-error)
nnoremap [e <Plug>(lsp-previous-error)


nmap <silent> K <plug>(lsp-hover)
nnoremap <silent> <C-f> :call lsp#ui#vim#output#scroll(+4)<CR>
nnoremap <silent> <C-b> :call lsp#ui#vim#output#scroll(-4)<CR>

syntax on               
set background=dark
colorscheme gruvbox

set wildmenu
set showmatch         
set lazyredraw
set visualbell
set t_vb=
set clipboard=unnamedplus

let mapleader = " "

function! s:on_lsp_buffer_enabled() abort
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> <leader>ca <plug>(lsp-code-action)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-s> lsp#scroll(-4)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
