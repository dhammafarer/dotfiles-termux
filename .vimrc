"--------------Vundle-----------------"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'mhartington/oceanic-next'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'skalnik/vim-vroom'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'powerline/powerline', { 'rtp': 'powerline/bindings/vim' }

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"-----------Vundle---END--------------"

"------------Settings-----------------"
syntax enable
set t_Co=256
colorscheme OceanicNext
set guioptions-=T                               "Removse top toolbar
set guioptions-=r                               "Removes right hand scroll bar
set go-=L                                       "Removes left hand scroll bar
set showmode                    		"always show what mode we're currently editing in
set nowrap                      		"don't wrap lines
set tabstop=2                   		"a tab is four spaces
set smarttab
set tags=tags
set softtabstop=2               		"when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   		"expand tabs by default (overloadable per file type later)
set shiftwidth=2                		"number of spaces to use for autoindenting
set shiftround                  		"use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  		"allow backspacing over everything in insert mode
set autoindent                  		"always set autoindenting on
set smartindent                 		"increate the indent in a new block
set copyindent                  		"copy the previous indentation on autoindenting
set number                      		"always show line numbers
set ignorecase                  		"ignore case when searching
set smartcase                   		"ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set novisualbell           			"don't beep
set noerrorbells         			"don't beep
set autowrite  					"Save on buffer switch
set mouse=a
set iskeyword-=_
set modifiable
set clipboard=unnamed
set guifont=Fira\ Code\ for\ Powerline\ 12
set linespace=7
"---------Settings---END--------------"

"----------------Keys-----------------"
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>				"fast saves

nmap <leader><leader>n :!node %<cr>
nmap <leader><leader>r :!ruby %<cr>
"nmap <leader><leader>e :!elixir %<cr>

nmap <leader><space> :nohlsearch<cr>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR> 		"Auto change directory to match current file ,cd
nmap <C-v> :vertical resize +5<cr>

nmap :bp :BufSurfBack<cr>			"go backward in buffer
nmap :bn :BufSurfForward<cr>			"go forward in buffer
map <leader>n :NERDTreeToggle<CR>
"-------------Keys---END--------------"
"
"-----------------CtrlP---------------"
map <D-p> :CtrlP<cr>
nmap <C-d> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/node_modules/**
set wildignore+=*/bin/**

let g:ctrlp_match_window = 'top,order::ttb,min:1,max:30,results:30'
"-------------CtrlP---END-------------"

"-----------Powerline-----------------"
let g:powerline_pycmd = 'py3'
let g:Powerline_symbols = 'fancy'
set laststatus=2   				"Always show the statusline
set encoding=utf-8 				"Necessary to show Unicode glyphs
set noshowmode 					"Hide the default mode text (e.g. -- INSERT -- below the statusline)
"--------Powerline---END--------------"

"-----------UltiSnips-----------------"
" youcompleteme remap tab
let g:ycm_key_list_select_completion=['<Down>']
"let g:ycm_key_list_previous_completion=[]
"
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"set completeopt-=preview "Remove preview window
"--------UltiSnips---END--------------"

"---------------Misc=-----------------"
highlight Search cterm=underline
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
command! H let @/="" 				                  "Remove search results
"let g:vimwiki_list = [{'path': '$HOME/Dropbox/Apps/vim/vimwiki'}]
:map <leader>c <Plug>VimwikiToggleListItem

let g:vroom_use_colors = 1
"------------Misc---END---------------"

"----------------Tabs-----------------"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 8gt
noremap <leader>0 :tablast<cr>
"--------------Tabs---END-------------"

" Create/edit file in the current directory
nmap <leader>e :edit %:p:h/

" For local replace
nnoremap gr *:%s///gc<left><left><left>

autocmd FileType vue runtime! ftplugin/html/sparkup.vim

"----------------- Commands -------------------"
command DiaryTime execute "put=system('date +%H:%M')"

"autocmd BufNewFile,BufRead *.vue set filetype=html "When opening or creating a .vue file set the filetype to HTML for proper rendering
"JSX
let g:jsx_ext_required = 0
" enable sparkup in jsx
autocmd FileType javascript.jsx runtime! ftplugin/html/sparkup.vim
let g:closetag_filenames = "*.html,*.erb,*.jsx"
let g:user_emmet_leader_key='<C-e>'
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

"backup dirs
set undodir=~/.vim/.undo//
set directory=~/.vim/.swp//
set nobackup
set noswapfile
