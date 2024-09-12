return {
  name = "java build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand "%:p"
    return {
      -- cmd = { "find . -type f | rg -i .java > sourceFiles.txt && javac" },
      cmd = { "javac" },
      args = { file },
      -- args = { "sourceFiles.txt" },
      components = {
        -- { "on_output_quickfix", statuses = { "FAILURE" }, open = true },
        { "on_complete_notify", statuses = { "SUCCESS" } },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "java" },
  },
}
