-- zoxide dentro de Neovim: elegir un directorio frecuente con Telescope
-- y cambiar el cwd a él. También añade `:Z <consulta>` y `:Zi`.
return {
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    cmd = { "Z", "Zi" },
    keys = {
      { "<leader>fz", function() require("telescope").extensions.zoxide.list() end, desc = "Zoxide: saltar a directorio" },
    },
    config = function()
      require("telescope").load_extension "zoxide"

      -- :Z foo  → salta al mejor resultado de zoxide para "foo"
      vim.api.nvim_create_user_command("Z", function(opts)
        local out = vim.fn.systemlist { "zoxide", "query", "--", unpack(opts.fargs) }
        if vim.v.shell_error ~= 0 or not out[1] then
          vim.notify("zoxide: sin resultados para " .. opts.args, vim.log.levels.WARN)
          return
        end
        vim.cmd.cd(out[1])
        vim.notify("cwd → " .. out[1])
      end, { nargs = "+", desc = "zoxide query + cd" })

      vim.api.nvim_create_user_command("Zi", function()
        require("telescope").extensions.zoxide.list()
      end, { desc = "zoxide con Telescope" })
    end,
  },
}
