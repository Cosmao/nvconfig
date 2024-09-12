return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    -- TODO: find out why I need to disable lazy load
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    { "xiyaowong/transparent.nvim", lazy = false },
  },

  {
    -- TODO: find out why I need to disable lazy load
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
  },

  {
    "rcarriga/nvim-notify",
    dependencies = {},
    config = function()
      -- require("telescope").load_extension "notify"
      -- require("telescope").extensions.notify.notify()
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },

  {
    -- TODO: find out why I need to disable lazy load
    "stevearc/overseer.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("overseer").setup {
        templates = {
          "builtin",
          "usr.java_build",
        },
      }
    end,
    lazy = false,
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
    config = function()
      require("dressing").setup {}
    end,
  },
}