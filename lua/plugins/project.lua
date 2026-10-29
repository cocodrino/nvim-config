return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "package.json", "pyproject.toml", "Makefile" },
        silent_chdir = true,
      }

      require("telescope").load_extension "projects"
    end,
  },
}
