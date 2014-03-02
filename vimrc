set nocompatible
let mapleader = ","

" Vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Include user's local vim bundles
" You can also override mapleader here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vim_bundles.local"))
  source ~/.vim_bundles.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"
" Bundler for vim, use :BundleInstall to install these bundles and
" :BundleUpdate to update all of them
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
let g:airline#extensions#branch#enabled = 0
let g:airline_section_y = ''
let g:airline_theme='wombat'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
"
" Open a file (like cmd-t but better). Use ,f or ,j(something, see bindings
" below)
"
" Includes a matcher written in c that is faster and more accurate, see:
" https://github.com/JazzCore/ctrlp-cmatcher
" It must be built, it requires python-dev as a dependency
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Don't manage working directory
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 2

map <leader>jv :let g:ctrlp_default_input = 'app/views/'<cr>:CtrlP<cr>
map <leader>jc :let g:ctrlp_default_input = 'app/controllers/'<cr>:CtrlP<cr>
map <leader>jm :let g:ctrlp_default_input = 'app/models/'<cr>:CtrlP<cr>
map <leader>jh :let g:ctrlp_default_input = 'app/helpers/'<cr>:CtrlP<cr>
map <leader>jl :let g:ctrlp_default_input = 'lib'<cr>:CtrlP<cr>
map <leader>jp :let g:ctrlp_default_input = 'public'<cr>:CtrlP<cr>
map <leader>js :let g:ctrlp_default_input = 'app/stylesheets/'<cr>:CtrlP<cr>
map <leader>jj :let g:ctrlp_default_input = 'app/javascripts/'<cr>:CtrlP<cr>
map <leader>jf :let g:ctrlp_default_input = 'features/'<cr>:CtrlP<cr>
map <leader>js :let g:ctrlp_default_input = 'spec/'<cr>:CtrlP<cr>
map <leader>ja :let g:ctrlp_default_input = 'spec/acceptance/'<cr>:CtrlP<cr>
map <leader>f :let g:ctrlp_default_input = 0<cr>:CtrlP<cr>
map <leader>u :let g:ctrlp_default_input = 0<cr>:CtrlPBuffer<cr>
map <leader>U :let g:ctrlp_default_input = 0<cr>:CtrlPLine<cr>
map <leader><leader>f :let g:ctrlp_default_input = 0<cr>:CtrlPClearCache<cr>:CtrlP<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some syntax highlighthing for rails and :Rextract to extract partials
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'tpope/vim-rails'

map <leader><leader>a :A<cr>
map <leader><leader>r :R<cr>
map <leader>va :AV<cr>
map <leader>vr :RV<cr>
map <leader>sa :AS<cr>
map <leader>sr :RS<cr>
" Make spec/test
map <leader>ms :exec ':Runittest '.expand("%:t:r").'!'<cr>



:runtime macros/matchit.vim

filetype plugin indent on

" Backups and swap
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/backup
set directory=~/.vim/backup

syntax on
