return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand "%:t"
          vim.cmd "LazyGit"
          vim.defer_fn(function()
            vim.api.nvim_feedkeys("/" .. file, "t", true)
            vim.api.nvim_input "<CR>"
            vim.api.nvim_input "<ESC>"
          end, 150)
        end,
        desc = "LazyGit (current file)",
      },
      {
        "<leader>gL",
        "<cmd>LazyGit<cr>",
        desc = "LazyGit",
      },
    },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.9
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
      vim.g.lazygit_use_neovim_remote = 1
    end,
  },
}
