local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "h", "cpp", "hpp" },
    dependencies = {
      "stevearc/overseer.nvim",
    },
    config = function()
      -- require "custom.configs.cmaketools"
      require("cmake-tools").setup(require "custom.configs.cmaketools")
      require("core.utils").load_mappings "cmaketools"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
    -- config = function()
    -- require("overseer").patch_dap(true)
    -- end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    config = function()
      local todocomments = require "todo-comments"
      todocomments.setup()
      require("core.utils").load_mappings "todo"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("core.utils").load_mappings "lazygit"
    end,
  },
  {
    "stevearc/overseer.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
    },
    opts = {},
    config = function()
      require("core.utils").load_mappings "overseer"
      require("overseer").setup { dap = false }
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {},
  },
}

return plugins
