-- alpha-nvim (startup screen) configuration
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ \   / _ \  / __\ /\ \/\ \\/\ \  / __\ __ \   ]],
  [[/\ \/\ \/\ \/\ \/\ \__ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \_\ \_\ \____/\ \___/  \ \_\ \____\ \_\/ ]],
  [[ \/_/\/_/\/_/\/_/\/___/  \/__/    \/_/\/___/\/_/   ]],
}

dashboard.section.buttons.val = {
  dashboard.button('e', '📁  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', '🔍  Find file', ':Telescope find_files<CR>'),
  dashboard.button('g', '📝  Find text', ':Telescope live_grep<CR>'),
  dashboard.button('r', '📚  Recent files', ':Telescope oldfiles<CR>'),
  dashboard.button('c', '⚙️   Configuration', ':e ~/.config/nvim/init.vim<CR>'),
  dashboard.button('q', '❌  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = 'Neovim'

alpha.setup(dashboard.config)

