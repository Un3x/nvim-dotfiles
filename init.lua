vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy-config")
require("plugins")
require("autocmd")
require("keymaps")
require("options")

require("config.noice-config")
require("config.bufferline-config")
require("config.illuminate-config")
require("config.lsp-config")
require("config.copilot-config")
require("config.flit-config")
require("config.treesitter-config")
require("config.telescope-config")
require("config.cmp-config")

require("config.tokyonight-config")
vim.cmd[[colorscheme tokyonight]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
