return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      focus = false,
      follow = true,
      auto_preview = true,
    },
    keys = {
      {
        "<leader>lT",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Trouble diagnostics (project)",
      },
      {
        "<leader>lb",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Trouble diagnostics (buffer)",
      },
      {
        "<leader>lo",
        "<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
        desc = "Trouble document symbols",
      },
      {
        "<leader>lq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Trouble quickfix",
      },
      {
        "<leader>lL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Trouble location list",
      },
    },
  },
}
