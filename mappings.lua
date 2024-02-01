---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.cmaketools = {
  plugin = true,
  n = {
    ["<leader>c"] = {
      "CMake",
    },
    ["<leader>cb"] = {
      "<cmd> CMakeBuild <CR>",
      "Build project with cmake",
    },
    ["<leader>cr"] = {
      "<cmd> CMakeRun <CR>",
      "Run the built cmake file",
    },
    ["<leader>cd"] = {
      "<cmd> CMakeDebug <CR>",
      "Debug the cmake binary",
    },
    ["<leader>cc"] = {
      "<cmd> CMakeClean <CR>",
      "CMakeClean",
    },
    ["<leader>cs"] = {
      "CMake select options",
    },
    ["<leader>csb"] = {
      "<cmd> CMakeSelectBuildTarget <CR>",
      "Select build target",
    },
    ["<leader>cst"] = {
      "<cmd> CMakeSelectLaunchTarget <CR>",
      "Select launch target",
    },
    ["<leader>csd"] = {
      "<cmd> CMakeSelectBuildType <CR>",
      "Select build type",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>d"] = { "DAP " },
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>ds"] = {
      "<cmd> DapStepInto <CR>",
      "Step into debugger",
    },
  },
}

M.todo = {
  plugin = true,
  n = {
    ["<leader>tt"] = {
      "<cmd> TodoTelescope <CR>",
      "Todo in Telescope",
    },
    ["<leader>tq"] = {
      "<cmd> TodoQuickFix <CR>",
      "Todo in quickfix",
    },
  },
}

M.lazygit = {
  plugin = true,
  n = {
    ["<leader>gl"] = {
      "<cmd> LazyGit <CR>",
      "Opens lazygit",
    },
  },
}

M.overseer = {
  plugin = true,
  n = {
    ["<leader>o"] = {
      "<cmd> OverseerToggle <CR>",
      "Toggle overseer",
    },
  },
}
-- more keybinds!

return M
