-- Treesitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash', 'c', 'cpp', 'css', 'dockerfile', 'go', 'html', 'javascript',
    'json', 'lua', 'markdown', 'python', 'rust', 'toml', 'typescript',
    'vim', 'yaml'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

