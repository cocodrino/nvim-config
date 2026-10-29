return {
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "rcarriga/nvim-notify" },
    config = function()
      require("tsc").setup {
        auto_open_qflist = true,
        auto_close_qflist = false,
        enable_progress_notifications = true,
        pretty_errors = true,
      }

      vim.keymap.set("n", "<leader>Tt", "<cmd>TSC<CR>", { desc = "typecheck TypeScript" })
      vim.keymap.set("n", "<leader>To", "<cmd>TSCOpen<CR>", { desc = "open TSC quickfix" })
      vim.keymap.set("n", "<leader>Tc", "<cmd>TSCClose<CR>", { desc = "close TSC quickfix" })
    end,
  },
}
