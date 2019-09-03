set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set number
filetype off

" Plugins
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'AutoComplPop'
" Code autocompletion
" default for Python
" for C/C++ autocompletion this file is reqiured ~/.vim/.ycm_extra_conf.py
" also run './install.py --clang-completer --system-libclang' at ~/.vim/bundle/YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
" display current file, git branch and so on
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'c.vim'
" For folding code
Plugin 'tmhedberg/SimpylFold'
" check Python/C/Java syntax
Plugin 'vim-syntastic/syntastic'
" Pep8 checking
Plugin 'nvie/vim-flake8'
" file tree
Plugin 'scrooloose/nerdtree'
" search anythin in vim
Plugin 'kien/ctrlp.vim'
" git integration
Plugin 'tpope/vim-fugitive'
" color scheme
" Plugin 'szorfein/fromthehell.vim'
" Plugin 'KKPMW/sacredforest-vim'
" Plugin 'morhetz/gruvbox'
" Java autocomplete
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'vim-jp/vim-java'

" Formatter
" Plugin 'chiel92/vim-autoformat'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'google/yapf', { 'rtp': 'plugins/vim' }

" Rust
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()
Glaive codefmt google_java_executable="java -jar /Users/ratnadeepb/google-java-format-1.7-all-deps.jar"
filetype plugin indent on    " required

" Auto close all brackets, quotes etc
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=8 shiftwidth=8      " a tab is 4 spaces
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" background and color
set background=light
" colorscheme murphy
" colorscheme fromthehell
" colorscheme sacredforest

" templates
if has("autocmd")
    augroup templates
        " C template has been set up by c.vim plugin in the 
        " ~/.vim/bundle/c.vim/c-support/templates/Templates file
        " set up python
        "autocmd VimEnter *py pu=strftime('%c')
        autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
        autocmd BufNewFile *.py pu=strftime('%c')

        autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java
        autocmd BufNewFile *.java pu=strftime('%c')
        autocmd FileType java setlocal omnifunc=javacomplete#Complete
    augroup END
endif

" flagging unecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" open NerdTree by default
au VimEnter *  NERDTree


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

"see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" close autocomplete window when done
let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for go to definition - leader key and g
" leader key mapped to spacebar
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" beautify Pyhton code
let python_highlight_all=1
syntax on

" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" access system clipboard on OSX
set clipboard=unnamed

" powerline settings
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" get syntastic to check for errors when a file is opened
let g:syntastic_check_on_open = 1

" Syntastic error and warning symbols
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "w"

" close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" switching between vim buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

" for C/C++ autocompletion
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

let mapleader = ","
nmap <leader>nt :NERDTreeToggle<cr>

" Have syntastic use checkstyle (Java)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '~/Downloads/checkstyle-8.14-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/Downloads/checkstyle.xml'

" smart import
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" enable usual imports
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
" Add all missing imports
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" Remove unused imports
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
