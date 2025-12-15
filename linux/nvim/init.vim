" ============================================================================
" General Settings
" ============================================================================
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Suppress deprecation warnings from plugins (they'll be fixed by plugin maintainers)
lua vim.deprecate = function() end

" ============================================================================
" UI Settings
" ============================================================================
set number
set cursorline
set showmatch
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set termguicolors
set mouse=a
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set colorcolumn=80
set showtabline=2  " Always show tabline (for lualine buffers)

" ============================================================================
" Search Settings
" ============================================================================
set hlsearch
set incsearch
set ignorecase
set smartcase

" ============================================================================
" Indentation Settings
" ============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" ============================================================================
" Performance Settings
" ============================================================================
set ttyfast
set updatetime=300
set timeoutlen=500
set ttimeoutlen=0

" ============================================================================
" File Management
" ============================================================================
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.local/share/nvim/undodir
set hidden

" ============================================================================
" Window Management
" ============================================================================
set splitbelow
set splitright

" ============================================================================
" Filetype & Syntax
" ============================================================================
filetype plugin indent on
syntax on

" ============================================================================
" Clipboard
" ============================================================================
set clipboard=unnamedplus

" ============================================================================
" Key Mappings
" ============================================================================
let mapleader = ','
let maplocalleader = '\\'

" Better quote wrapping
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Quick escape
inoremap jk <Esc>
inoremap kj <Esc>

" nvim-tree toggle
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>E :NvimTreeFindFile<CR>

" Copilot (if installed)
nnoremap <silent> <C-e> :Copilot enable<CR>
nnoremap <silent> <C-d> :Copilot disable<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" Comment toggle (using Comment.nvim)
nnoremap <leader>/ <cmd>lua require('Comment.api').toggle.linewise.current()<CR>
vnoremap <leader>/ <ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>ba :bufdo bdelete<CR>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ============================================================================
" Plugin Management
" ============================================================================
call plug#begin('~/.local/share/nvim/plugged')

" Core Dependencies
Plug 'nvim-lua/plenary.nvim'

" File Navigation
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" LSP & Completion (Native Neovim LSP)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Syntax Highlighting & Parsing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git Integration
Plug 'lewis6991/gitsigns.nvim'

" Utilities
Plug 'numToStr/Comment.nvim'  " Modern replacement for vim-commentary
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'  " Auto-close HTML/JSX tags
Plug 'pocco81/auto-save.nvim'
Plug 'turbio/bracey.vim'

" UI & Status
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'  " Better icon support
Plug 'folke/which-key.nvim'  " Keybinding hints
Plug 'folke/trouble.nvim'  " Better diagnostics UI
Plug 'goolord/alpha-nvim'  " Startup screen

" Colorscheme

Plug 'tomasiser/vim-code-dark'

call plug#end()

" ============================================================================
" Plugin Configuration
" ============================================================================
" Load Lua configurations safely
lua << EOF
  local configs = {
    'telescope_config',
    'gitsigns_config',
    'lualine_config',
    'nvim_tree_config',
    'lsp_config',
    'cmp_config',
    'treesitter_config',
    'autopairs_config',
    'which_key_config',
    'trouble_config',
    'alpha_config'
  }
  
  for _, config in ipairs(configs) do
    local ok, _ = pcall(require, config)
    if not ok then
      vim.notify('Failed to load ' .. config, vim.log.levels.WARN)
    end
  end
EOF

" ============================================================================
" Autocommands
" ============================================================================
augroup vimrc
  autocmd!
  " Auto-create undo directory
  autocmd BufWritePre * call mkdir(&undodir, 'p')
  
  " Remember last cursor position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  
  " Auto-format on save (if formatter is available)
  " autocmd BufWritePre * lua vim.lsp.buf.format()
  
  " Highlight on yank
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

" ============================================================================
" Colorscheme
" ============================================================================
colorscheme codedark
