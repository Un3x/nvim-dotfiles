return {
  -- Coloscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  -- Vim illuminate
  "RRethy/vim-illuminate",
  --Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    }
  },
  -- LSP
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', lazy = true, config= false },
  {'neovim/nvim-lspconfig'},
  -- Completion
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  -- Copilot
  { "zbirenbaum/copilot.lua", },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  -- Leap
  "ggandor/leap.nvim",
  "ggandor/flit.nvim",
  -- Tree
  "nvim-tree/nvim-tree.lua",
  -- VimRails
  "tpope/vim-rails",
  -- Treesitter
  'nvim-treesitter/nvim-treesitter',
  -- Git
  'tpope/vim-fugitive',
  -- which-key
  "folke/which-key.nvim",
  -- preview images
  {
    'https://github.com/adelarsq/image_preview.nvim',
    event = 'VeryLazy',
    config = function()
      require("image_preview").setup()
    end
  },

}
