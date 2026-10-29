return {
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("better-ts-errors").setup {
        keymaps = {
          toggle = "<leader>le",
          go_to_definition = "<leader>lx",
        },
      }
    end,
  },
}
