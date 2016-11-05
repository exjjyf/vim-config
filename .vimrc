"+----------------------------------------------+
"| @file	.vimrc								|
"| @brief	vim配置文件							|
"| @author	金奕帆								|
"| @date	2016-09-25							|
"+----------------------------------------------+
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
" "call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
" Plugin 'vim-scripts/OmniCppComplete'
Plugin 'majutsushi/tagbar'
" Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'FuzzyFinder'

filetype plugin indent on     " required

"+----------------------------------------------+
"| @brief	common config						|
"| @date	2016-09-25							|
"+----------------------------------------------+

" execute pathogen#infect()
syntax on
set number
set cursorline

set foldmethod=syntax
set foldlevel=100

" set encoding=utf-8

set history=1000

set autoindent
set smartindent

" set expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab

set showmatch

set incsearch
set hlsearch

set nobackup

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

augroup filetype
	au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

let mapleader = " " "设置空格作为leader按键，方便操作
nmap <Leader>w :w<CR>


"+----------------------------------------------+
"| @brief	NERDTree config						|
"| @date	2016-09-25							|
"+----------------------------------------------+
map <silent><F2> <ESC>:NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeHighlightCursorline=1 "高亮光标所在行
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"+----------------------------------------------+
"| @brief	nerdcommenter config				|
"| @date	2016-09-25							|
"+----------------------------------------------+
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation

"+----------------------------------------------+
"| @brief	vim color solarized config			|
"| @date	2016-09-25							|
"+----------------------------------------------+
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

"+----------------------------------------------+
"| @brief	airline config						|
"| @date	2016-09-25							|
"+----------------------------------------------+
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airlien_theme="solarized"
nmap <silent><C-p> :tabp<CR>
nmap <silent><C-n> :tabn<CR>

"+----------------------------------------------+
"| @brief	a config							|
"| @date	2016-09-26							|
"+----------------------------------------------+
nmap <silent><C-A> :A<CR>
imap <silent><C-A> <ESC><C-A>
nmap <silent><leader>av :AV<CR>
imap <silent><leader>av <ESC><C-A><C-V>

" "+----------------------------------------------+
" "| @brief	OmniCppComplete config				|
" "| @date	2016-09-26							|
" "+----------------------------------------------+
" set tags+=~/.vim/tags/cpp "C++ STL
" " set tags+=~/.vim/tags/boost "boost

" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif "auto close complete window
" set completeopt=menuone,menuone " other choose longest,menu

" let OmniCpp_NamespaceSearch=2
" let OmniCpp_GlobalScopeSearch=1
" let OmniCpp_DisplayMode=1			" always show all members
" let OmniCpp_ShowScopeInAbbr=0
" let OmniCpp_ShowAccess=1
" let OmniCpp_ShowPrototypeInAbbr=1	" show function parameter lists
" let OmniCpp_MayCompleteDot=1		" complete after .
" let OmniCpp_MayCompleteArrow=1		" complete after ->
" let OmniCpp_MayCompleteScope=1		" complete after ::
" let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD", "__gnu_cxx"]
" let OmniCpp_SelectFirstItem=0		" select first but don't change
" let OmniCpp_LocalSearchDecl=1

" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType java set omnifunc=javacomplete#Complete
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" if has("autocmd") && exists("+omnifunc")
"     autocmd Filetype *
"     \ if &omnifunc == "" |
"     \    setlocal omnifunc=syntaxcomplete#Complete |
"     \ endif
" endif
" let g:rubycomplete_buffer_loading=1

"+----------------------------------------------+
"| @brief	tagbar config						|
"| @date	2016-09-26							|
"+----------------------------------------------+
nmap <silent><F3> :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_left=1

" "+----------------------------------------------+
" "| @brief	supertab							|
" "| @date	2016-09-26							|
" "+----------------------------------------------+
" let g:SuperTabRetainCompletionType=2
" let g:SuperTabDefaultCompletionType="<C-X><C-N><C-P>"
" let g:SuperTabNoCompleteAfter=['/', ',', '\s', ':', ';', ')', '}', '{', '(', '<', '>', '|']
" let g:SuperTabCompletionContexts=['s:ContextText']

"+----------------------------------------------+
"| @brief 	custom command config				|
"| @date	2016-09-26							|
"+----------------------------------------------+
func! Ctags()
	exec "! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -o tags"
endfunc

if !exists(':Ctags')
	command! Ctags call Ctags()
endif

"+----------------------------------------------+
"| @brief	YouCompleteMe config				|
"| @date	2016-11-06							|
"+----------------------------------------------+
let g:ycm_key_invoke_completion = '<C-v>'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>e :YcmDiags<CR>
nnoremap <silent><F4> :YcmShowDetailedDiagnostic<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
""Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
