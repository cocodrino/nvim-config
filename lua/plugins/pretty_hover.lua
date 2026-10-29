return {
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    config = function()
      require("pretty_hover").setup {
        line = {
          max_length = 120,
        },
      }

      -- Override default hover with the formatted version
      vim.keymap.set("n", "K", function()
        require("pretty_hover").hover()
      end, { desc = "Pretty hover" })

      vim.keymap.set("n", "<leader>li", function()
        require("pretty_hover").hover()
      end, { desc = "LSP hover (pretty)" })
    end,
  },
}
