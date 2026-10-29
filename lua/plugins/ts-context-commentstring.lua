return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = true,
      }
      vim.opt.updatetime = 300
    end,
  },
}
