return {
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      floating_window = true,
      hint_enable = false,
      handler_opts = {
        border = "rounded",
      },
      toggle_key = "<C-k>",
      select_signature_key = "<C-n>",
      move_signature_window_key = { "<M-k>", "<M-j>" },
    },
  },
}
