-- yazi como explorador flotante dentro de Neovim.
-- Dentro de yazi, `z` usa zoxide y al salir se abre el archivo elegido.
return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>yy", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Yazi en el archivo actual" },
      { "<leader>yc", "<cmd>Yazi cwd<cr>", desc = "Yazi en el cwd" },
      { "<leader>yr", "<cmd>Yazi toggle<cr>", desc = "Yazi: retomar última sesión" },
    },
    opts = {
      open_for_directories = false,
      keymaps = { show_help = "<f1>" },
    },
  },
}
