return {
  {
    "m-demare/hlargs.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("hlargs").setup {
        color = "#ef9062",
        highlight = {},
        excluded_filetypes = {},
        paint_arg_declarations = true,
        paint_arg_usages = true,
        paint_catch_blocks = false,
        extras = {
          named_parameters = false,
        },
        hl_priority = 120,
      }
    end,
  },
}
