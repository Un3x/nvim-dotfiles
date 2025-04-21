return {
  -- Neovim setup documentation
  { "folke/neodev.nvim", opts = {} },

  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    event = "BufReadPost",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Vim illuminate
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost"
  },
  
  --Telescope
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.3',
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    },
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
  {
    'hrsh7th/cmp-nvim-lsp',
    event = "InsertEnter"
  },
  {
    'hrsh7th/nvim-cmp',
    event = {"InsertEnter", "CmdlineEnter"}
  },
  
  -- Copilot
  { 
    "zbirenbaum/copilot.lua",
    event = "InsertEnter"
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  
  -- Leap
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    dependencies = { "ggandor/flit.nvim" }
  },
  
  -- Tree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus"}
  },
  
  -- VimRails
  {
    "tpope/vim-rails",
    ft = {"ruby", "eruby", "yaml", "haml"}
  },
  
  -- Treesitter
  'nvim-treesitter/nvim-treesitter',
  
  -- Git
  {
    'tpope/vim-fugitive',
    cmd = {"Git", "Gstatus", "Gblame", "Gdiff"}
  },
  
  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy"
  },
  
  -- preview images
  {
    'https://github.com/adelarsq/image_preview.nvim',
    event = 'VeryLazy',
    config = function()
      require("image_preview").setup()
    end
  },
  
  -- CopilotChat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatExplain"
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
  },
}
