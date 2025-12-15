-- trouble.nvim configuration
require('trouble').setup({
  position = 'bottom',
  height = 10,
  width = 50,
  icons = true,
  mode = 'workspace_diagnostics',
  severity = nil,
  group = true,
  padding = true,
  cycle_results = true,
  action_keys = {
    close = 'q',
    cancel = '<esc>',
    refresh = 'r',
    jump = { '<cr>', '<tab>' },
    open_split = { '<c-x>' },
    open_vsplit = { '<c-v>' },
    open_tab = { '<c-t>' },
    jump_close = { 'o' },
    toggle_mode = 'm',
    switch_severity = 's',
    toggle_preview = 'P',
    hover = 'K',
    preview = 'p',
    close_folds = { 'zM', 'zm' },
    open_folds = { 'zR', 'zr' },
    toggle_fold = { 'zA', 'za' },
    previous = 'k',
    next = 'j',
  },
  multiline = true,
  indent_lines = true,
  win_config = { border = 'single' },
  auto_open = false,
  auto_close = false,
  auto_preview = true,
  auto_fold = false,
  auto_jump = { 'lsp_definitions' },
  signs = {
    error = '󰅚',
    warning = '󰀪',
    hint = '󰌶',
    information = '󰋼',
    other = '󰘠',
  },
  use_diagnostic_signs = false,
})

-- Key mappings
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Toggle diagnostics' })
vim.keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer diagnostics' })
vim.keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>', { desc = 'Error diagnostics' })
vim.keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location list' })
vim.keymap.set('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix list' })

