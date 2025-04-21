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
  {
    'hrsh7th/cmp-buffer',
    event = "InsertEnter"
  },
  {
    'hrsh7th/cmp-path',
    event = "InsertEnter"
  },
  
  -- Copilot
  { 
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "right", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end
      }
    }
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
  {
    'lewis6991/gitsigns.nvim',
    event = "BufReadPre",
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          
          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})
          
          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})
          
          -- Actions
          map('n', '<leader>hs', gs.stage_hunk)
          map('n', '<leader>hr', gs.reset_hunk)
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
        end
      })
    end
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('diffview').setup({
        enhanced_diff_hl = true,
        keymaps = {
          view = {
            ["q"] = "<Cmd>DiffviewClose<CR>",
          },
          file_panel = {
            ["q"] = "<Cmd>DiffviewClose<CR>",
          },
        }
      })
    end
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
  
  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
  },
}
