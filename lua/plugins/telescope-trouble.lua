return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "folke/trouble.nvim" },
    opts = function(_, opts)
      opts = opts or {}
      opts.defaults = opts.defaults or {}
      opts.defaults.mappings = opts.defaults.mappings or {}
      opts.defaults.mappings.i = opts.defaults.mappings.i or {}
      opts.defaults.mappings.n = opts.defaults.mappings.n or {}

      local ok, trouble_telescope = pcall(require, "trouble.sources.telescope")
      if ok then
        local open = trouble_telescope.open
        opts.defaults.mappings.i["<C-t>"] = open
        opts.defaults.mappings.n["<C-t>"] = open
      end

      return opts
    end,
  },
}
