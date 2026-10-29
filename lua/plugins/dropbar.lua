return {
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      require("dropbar").setup()

      local api = require "dropbar.api"
      vim.keymap.set("n", "<leader>mp", api.pick, { desc = "dropbar pick symbol" })
      vim.keymap.set("n", "[m", api.goto_context_start, { desc = "dropbar context start" })
      vim.keymap.set("n", "]m", api.select_next_context, { desc = "dropbar next context" })
    end,
  },
}
