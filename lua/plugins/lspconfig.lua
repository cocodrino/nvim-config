-- Cargar nvim-lspconfig también cuando se abre un archivo desde un nvim vacío.
-- El evento original de NvChad es User FilePost, que solo dispara al inicio.
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
  },
}
