filetype plugin indent on

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Fuzzy search
Plug '~/.fzf'
" Autocompletion
"Plug 'Valloric/YouCompleteMe'
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
" Linting
"Plug 'vim-syntastic/syntastic'
" Linting/checking
"Plug 'w0rp/ale'
Plug 'vhdirk/vim-cmake'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Initialize plugin system
call plug#end()

"" YouCompleteMe config
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"
" Clear highlighting on entering insertion mode 
let didit = 0
autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
autocmd! InsertLeave * let didit = 0

" Delete trailing whitespacau 
autocmd FileType c,cpp,glsl,yaml,python,ruby,html,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

" Color scheme
colorscheme tender

" Config C++ header/source switching
map <F5> :FSHere<CR>

" openframeworks C++ 
:nnoremap <leader>md :MakeDebugQF<CR>
:nnoremap <leader>mm :make<CR>
:nnoremap <leader>ml :Lint<CR>

set expandtab
set shiftwidth=4
set tabstop=4

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:ale_linters = {'cpp': ['cppcheck']}

"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
"let g:loaded_syntastic_c_cppcheck_checker = 1

command Lint cexpr system('scripts/lint.sh')
autocmd QuickFixCmdPost [^l]* cwindow
command MakeDebugQF cexpr system('make Debug -j12 \|& grep error:')
command MakeQF cexpr system('make -j12 \|& grep error:')
filetype plugin indent on
