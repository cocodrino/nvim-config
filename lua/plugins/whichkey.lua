return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>f", group = "Telescope" },
        { "<leader>g", group = "Git" },
        { "<leader>gD", group = "CodeDiff" },
        { "<leader>hc", group = "Console" },
        { "<leader>hp", group = "Harpoon" },
        { "<leader>l", group = "LSP" },
        { "<leader>t", group = "Tree" },
        { "<leader>w", group = "Workspace / Worktree" },
      })
      return opts
    end,
  },
}
