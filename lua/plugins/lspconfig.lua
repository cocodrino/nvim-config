-- Cargar nvim-lspconfig también cuando se abre un archivo desde un nvim vacío.
-- El evento original de NvChad es User FilePost, que solo dispara al inicio.
return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = { preset = "default" },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
  },
}
