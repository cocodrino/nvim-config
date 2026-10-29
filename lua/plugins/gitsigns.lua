return {
  {
    "lewis6991/gitsigns.nvim",
    -- Merged on top of NvChad's defaults: inline blame on the cursor line, like VS Code
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { delay = 300 },
      current_line_blame_formatter = "<author>, <author_time:%R> • <summary>",
    },
  },
}
