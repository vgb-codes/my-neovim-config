set mouse=a

language en_US

call plug#begin("~/.local/share/nvim/plugged")
	" Colorscheme
	Plug 'morhetz/gruvbox'
  Plug 'rafi/awesome-vim-colorschemes'
	" NERDtree
	Plug 'scrooloose/nerdtree'

  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" Dev tools
	Plug 'ryanoasis/vim-devicons'
	" Syntax highlighting
	Plug 'scrooloose/syntastic'
	" Rainbow brackets
	Plug 'frazrepo/vim-rainbow'
  " Lightline
  Plug 'itchyny/lightline.vim'
  " Fuzzy Finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-git', 'coc-julia', 'coc-python', 'coc-java', 'coc-clangd', 'coc-sh', 'coc-yaml', 'coc-tailwindcss', 'coc-tsserver']
  
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  Plug 'preservim/nerdcommenter'

  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'airblade/vim-gitgutter'

  Plug 'tpope/vim-fugitive'

  Plug 'NLKNguyen/papercolor-theme'
call plug#end()


if (has("termguicolors"))
	set termguicolors
endif

syntax enable
set smarttab
set relativenumber
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

" Theme
set background=dark
colorscheme PaperColor

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimaUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeIgnore = ['^node_modules$']
" Automatically close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Global rainbow brackets
let g:rainbow_active = 1

" Open new split panes to right and below
set splitright
set splitbelow
" Turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" Open terminal on ctrl+n 
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Fuzzy finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\}

" Tabs
" Shift to left tab
nnoremap H gT
nnoremap L gt

" Gitgutter executable
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

" Font settings
set guifont=FiraCode\ Nerd\ Font\ 14

" Lightline config
let g:lightline = {
\ 'colorscheme': 'PaperColor',
\ }

set shell=powershell shellquote=( shellpipe=\| shellredir=> shellxquote=
set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
