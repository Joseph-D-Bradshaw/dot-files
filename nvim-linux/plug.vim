if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'glepnir/lspsaga.nvim'
endif

call plug#end()

