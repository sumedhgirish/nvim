-- Options for lazy.nvim

return {
  defaults = {
    lazy = true,
  },
  spec = {
    -- LSP
    {
      "williamboman/mason.nvim",
      lazy = false,
      priority = 1000,
      opts = require("hogfiles.configs.mason"),
      keys = require("hogfiles.keymaps.mason"),
    },
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
      },
      opts = require("hogfiles.configs.mason_lspconfig"),
      keys = require("hogfiles.keymaps.mason_lspconfig"),
    },
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
      },
      opts = require("hogfiles.configs.mason_null_ls"),
      keys = require("hogfiles.keymaps.mason_null_ls"),
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
      },
      opts = require("hogfiles.configs.mason_dap"),
      keys = require("hogfiles.keymaps.mason_dap"),
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
      },
    },
    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = require("hogfiles.configs.lazydev"),
    },
    {
      "zeioth/garbage-day.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
      event = "VeryLazy",
      opts = require("hogfiles.configs.garbageday"),
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "InsertEnter",
      opts = require("hogfiles.configs.lsp_signature"),
    },
    {
      "stevearc/conform.nvim",
      opts = require("hogfiles.configs.conform"),
    },
    {
      "folke/trouble.nvim",
      cmd = "Trouble",
      opts = require("hogfiles.configs.trouble"),
      keys = require("hogfiles.keymaps.trouble"),
    },
    -- Catppuccin Theme
    {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,
      priority = 1000,
      config = function()
        require("catppuccin").setup(
          require("hogfiles.configs.colorscheme")
        )
        vim.cmd([[colorscheme catppuccin]])
      end,
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      lazy = false,
      opts = require("hogfiles.configs.lualine"),
    },
    {
      'stevearc/oil.nvim',
      dependencies = { "echasnovski/mini.icons" },
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = require("hogfiles.configs.oil"),
      lazy = false,
    },
    -- Syntax highlighting
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      lazy = false,
      config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup(require("hogfiles.configs.treesitter"))
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = "BufReadPre",
      opts = require("hogfiles.configs.treesitter-context"),
    },
    {
      "folke/twilight.nvim",
      keys = require("hogfiles.keymaps.twilight"),
      opts = require("hogfiles.configs.twilight"),
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = require("hogfiles.configs.whichkey"),
      keys = require("hogfiles.keymaps.whichkey"),
    },
    -- Auto-pairing
    {
      "utilyre/sentiment.nvim",
      version = "*",
      event = "BufReadPost",
      opts = require("hogfiles.configs.sentiment"),
      init = function()
        vim.g.loaded_matchparen = 1
      end,
    },
    {
      "kylechui/nvim-surround",
      version = "*",
      event = "BufReadPost",
      opts = require("hogfiles.configs.surround"),
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = require("hogfiles.configs.autopairs"),
    },
    {
      "HiPhish/rainbow-delimiters.nvim",
      event = "BufReadPost",
      config = function()
        require('rainbow-delimiters.setup').setup(
          require("hogfiles.configs.rainbow_delimiters")
        )
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = require("hogfiles.configs.indent_blankline"),
      event = "BufReadPost",
    },
    -- Movement
    {
      "DanilaMihailov/beacon.nvim",
      event = "VeryLazy",
      opts = { speed = 1 },
    },
    {
      "rasulomaroff/reactive.nvim",
      lazy = false,
      opts = {
        load = { 'catppuccin-mocha-cursor', 'catppuccin-mocha-cursorline' },
      },
    },
    {
      "ggandor/leap.nvim",
      lazy = false,
      config = function()
        require("leap").create_default_mappings()
      end,
    },
    -- File Traversal
    {
      "nvim-telescope/telescope.nvim",
      tag = '0.1.8',
      dependencies = {
        'nvim-lua/plenary.nvim',
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
        },
      },
      keys = require("hogfiles.keymaps.telescope"),
      opts = require("hogfiles.configs.telescope"),
    },
    -- Undo
    {
      "jiaoshijie/undotree",
      dependencies = "nvim-lua/plenary.nvim",
      config = true,
      keys = { -- load the plugin only when using it's keybinding:
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
      },
    },
    -- Magic
    {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPost",
      opts = require("hogfiles.configs.gitsigns")
    },
    {
      "Zeioth/compiler.nvim",
      cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
      dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
      opts = require("hogfiles.configs.compiler-nvim"),
      keys = require("hogfiles.keymaps.compiler-nvim")
    },
    {
      "stevearc/overseer.nvim",
      lazy = false,
      opts = require("hogfiles.configs.overseer")
    },
    {
      "j-hui/fidget.nvim",
      event = "VeryLazy",
      opts = require("hogfiles.configs.fidget")
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'echasnovski/mini.nvim'
      },
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = require('hogfiles.configs.render_markdown'),
      ft = { "markdown" }
    },
    -- Competitive Programming
    {
      'A7lavinraj/assistant.nvim',
      dependencies = { 'folke/snacks.nvim' },
      lazy = false,
      opts = require('hogfiles.configs.assistant'),
      keys = require('hogfiles.keymaps.assistant')
    },
    {
      'folke/snacks.nvim',
      lazy = false,
      priority = 1000,
      opts = require('hogfiles.configs.snacks'),
    },
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
  lockfile = vim.fn.stdpath("config") .. "/lua/hogfiles/configs/.lazy-lock.json",
  ui = {
    border = "rounded",
    backdrop = 40,
  },
}
