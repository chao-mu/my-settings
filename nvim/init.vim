" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Fuzzy search
Plug '~/.fzf'
" Autocompletion
Plug 'Valloric/YouCompleteMe'
" Debugger
Plug 'sakhnik/nvim-gdb'
" Status bar bling
Plug 'vim-airline/vim-airline'
" Color schemes
Plug 'rafi/awesome-vim-colorschemes'
" Switch between C++ header/source
Plug 'derekwyatt/vim-fswitch'
" GLSL highlighting
Plug 'tikhomirov/vim-glsl'

" Initialize plugin system
call plug#end()

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" Clear highlighting on entering insertion mode 
let didit = 0
autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
autocmd! InsertLeave * let didit = 0

" Delete trailing whitespacau 
autocmd FileType c,cpp,python,ruby,html autocmd BufWritePre <buffer> %s/\s\+$//e

" Color scheme
colorscheme tender

" Config C++ header/source switching
map <F5> :FSHere<CR>

" openframeworks C++ 
:nnoremap <leader>md :!make Debug<CR>
:nnoremap <leader>mm :!make<CR>

set expandtab
set shiftwidth=4
set tabstop=4
