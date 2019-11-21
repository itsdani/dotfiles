"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.dein')
  call dein#begin('$HOME/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('chriskempson/base16-vim')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  call dein#add('kien/ctrlp.vim')
  call dein#add('easymotion/vim-easymotion')

  call dein#add('mhinz/vim-startify')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('mbbill/undotree')
  call dein#add('junegunn/vim-peekaboo')

  call dein#add('ajmwagar/vim-deus')

"  call dein#add('Valloric/YouCompleteMe', {'merged': 0})
"  call dein#add('rhysd/vim-clang-format')
  call dein#add('tpope/vim-commentary')
  call dein#add('purescript-contrib/purescript-vim')

  call dein#add('godlygeek/tabular')
  call dein#add('AndrewRadev/splitjoin.vim')

  call dein#add('tpope/vim-surround')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
"

" auto reload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" ================================
"           CONFIG
" ================================

" janah
":autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme janah

" base16
"autocmd ColorScheme base16-eighties highlight Normal ctermbg=235
"colorscheme base16-eighties


" deus
autocmd ColorScheme deus highlight Normal ctermbg=235
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark " Setting dark mode
colorscheme deus
let g:deus_termcolors=256



set autoindent
set expandtab
set softtabstop =2
set shiftwidth  =2
set shiftround

set backspace   =indent,eol,start
set hidden
set laststatus  =2
set display     =lastline

set showmode
set showcmd

set number

set incsearch
set hlsearch

set ttyfast
set lazyredraw

set splitbelow
set splitright

set wrapscan
set report      =0
set synmaxcol   =200
set synmaxcol   =200

set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:.'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.,trail:.'
endif

set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo/
set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo<Paste>

let g:ctrlp_working_path_mode = 'ra'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'


" ================================
"           KEYBINDINGS
" ================================
let mapleader = "\<Space>"

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>t= :Tabularize /=<cr>
nnoremap <leader>t: :Tabularize /:<cr>

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc ClangFormatAutoEnable

