return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      vim.diagnostic.config { virtual_text = false }

      require("tiny-inline-diagnostic").setup {
        preset = "modern",
        transparent_bg = false,
        transparent_cursorline = true,
        options = {
          show_source = {
            enabled = true,
          },
          multilines = {
            enabled = true,
            always_show = false,
          },
          enable_on_insert = false,
        },
      }
    end,
  },
}
