-- nvim-autopairs configuration
local ok, npairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    java = false,
  },
  disable_filetype = { 'TelescopePrompt', 'vim' },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'ParenMatch',
    highlight_grey = 'LineNr'
  },
})

-- Integrate with nvim-cmp (if available)
local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if cmp_autopairs_ok then
  local cmp_ok, cmp = pcall(require, 'cmp')
  if cmp_ok and cmp.event then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end
end

-- Integrate with treesitter (if available)
local ts_conds_ok, ts_conds = pcall(require, 'nvim-autopairs.ts-conds')
if ts_conds_ok and npairs.rules then
  npairs.rules:push({
    cond = ts_conds.is_not_ts_node({ 'function', 'method' }),
    pair = '(',
    action = ts_conds.npairs_config.scratch({ 'string', 'comment' }),
  })
end

