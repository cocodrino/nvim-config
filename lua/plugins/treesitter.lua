return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "jsx",
        "typescript",
        "javascript",
        "html",
        "css",
        "json",
        "jsonc",
      })

      opts.auto_install = true
      opts.highlight = opts.highlight or {}
      opts.highlight.enable = true
    end,
  },
}
