" automatic installation for vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif" vim-plug

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dylanaraps/wal.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'lervag/vimtex'
call plug#end()

" lightline configuration
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wal',
      \ }
set noshowmode

" vim-pencil configuration
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
                \ | call lightline#init() 
                \ | setl spell spl=en_us
                \ | au BufWinEnter * Goyo 
augroup END
let g:pencil#textwidth = 74

" goyo configuration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" appearance
colorscheme wal
set number

" indentation 
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
vmap '' :w !pbcopy<CR><CR>
