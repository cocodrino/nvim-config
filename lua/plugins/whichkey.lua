return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        -- Groups
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Action / Cheatsheet" },
        { "<leader>f", group = "Telescope" },
        { "<leader>g", group = "Git" },
        { "<leader>gD", group = "CodeDiff" },
        { "<leader>hc", group = "Console" },
        { "<leader>hp", group = "Harpoon" },
        { "<leader>l", group = "LSP" },
        { "<leader>m", group = "Minimap / Marks" },
        { "<leader>t", group = "Tree / Themes" },
        { "<leader>T", group = "TypeScript" },
        { "<leader>w", group = "Workspace / Worktree" },
        { "<leader>wi", group = "Window" },

        -- Explicit labels for single-letter prefixes to avoid "+N keymaps"
        { "<leader>ca", desc = "LSP code action" },
        { "<leader>ch", desc = "NvCheatsheet" },
        { "<leader>ma", desc = "Telescope marks" },
        { "<leader>mm", desc = "Toggle minimap" },
        { "<leader>th", desc = "Telescope themes" },
        { "<leader>tr", desc = "Toggle nvim-tree" },
        { "<leader>ds", desc = "LSP diagnostic loclist" },
        { "<leader>e", desc = "NvimTree focus" },
        { "<leader>n", desc = "Toggle line number" },
        { "<leader>rn", desc = "Toggle relative number" },
        { "<leader>x", desc = "Close buffer" },
        { "<leader>/", desc = "Toggle comment" },
        { "<leader>wK", desc = "WhichKey all keymaps" },
        { "<leader>wk", desc = "WhichKey query" },
      })
      return opts
    end,
  },
}
