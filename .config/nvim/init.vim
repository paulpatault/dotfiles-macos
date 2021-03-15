syntax on

set hidden
set encoding=utf-8
set nowrap
set colorcolumn=80
set relativenumber
set number
set mouse=a
set clipboard=unnamedplus
set backspace=indent,eol,start
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set autoindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

" Prevent a user from using arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map deplacement entre windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Map resize splits
nnoremap <silent> <Leader>= :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -10"<CR>

nnoremap <silent> <Leader>h= :exe "resize +10"<CR>
nnoremap <silent> <Leader>h- :exe "resize -10"<CR>

" Move selection up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

""""""""""""""""""""""Plugins""""""""""""""""""""""

call plug#begin(stdpath('data') . '/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-airline/vim-airline'
  Plug 'jiangmiao/auto-pairs'
  "Plug 'dense-analysis/ale'
  Plug 'mbbill/undotree'
  Plug 'lervag/vimtex'
  Plug 'cdelledonne/vim-cmake'
call plug#end()

nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap <C-p> :FZF<cr>
nnoremap <leader>u :UndotreeToggle<CR>

""""""""""""""""""""Coc Setting""""""""""""""""""""""
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <silent> K :call <SID>show_documentation()<CR>

nnoremap <silent> <leader>x :CocCommand clangd.switchSourceHeader<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
""""""""""""""""""""END Coc Setting""""""""""""""""""

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }


" Custom Silent command that will call redraw
command! -nargs=+ Silent
\   execute 'silent ! <args>'
\ | redraw!

nnoremap <silent> <F5> :Silent pdflatex % && open -a Preview && open -a Kitty && rm *.log *.aux<CR>
nnoremap <silent> <F6> :Silent mdpdf % && open -a Preview && open -a Kitty<CR>

"""""""""""""""""""""""Theme"""""""""""""""""""""""""
colorscheme gruvbox

"""""""""""""""""""""""Autocmd"""""""""""""""""""""""
" spell checking
function! ToggleSpellLang()
    " toggle between en and fr
    if &spelllang =~# 'en'
        :set spelllang=fr
    else
        :set spelllang=fr,en
    endif
endfunction

nnoremap <leader>sp :setlocal spell!<CR> " toggle spell on or off
nnoremap <F8> :call ToggleSpellLang()<CR> " toggle language

augroup YEPLA
  autocmd!
  autocmd Filetype c setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype java setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufWritePre * %s/\s\+$//e
  "autocmd BufWritePost *.tex :exe "normal \<F5>"
  "autocmd BufWritePost *.md :exe "normal \<F6>"
augroup END
