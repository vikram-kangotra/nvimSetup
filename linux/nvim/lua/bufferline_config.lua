-- bufferline.nvim configuration
-- Temporarily using minimal config due to compatibility issues
local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

-- Try with absolutely minimal configuration
bufferline.setup({})

-- Key mappings (will work even if bufferline has issues)
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
