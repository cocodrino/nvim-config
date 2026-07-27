return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      -- Extender f/F/t/T para saltar entre líneas y repetir con ; ,
      require("mini.jump").setup()

      -- Animaciones suaves de scroll, cursor, etc.
      -- Desactivar scroll/cursor para evitar sensación de lag
      require("mini.animate").setup({
        cursor = { enable = false },
        scroll = { enable = false },
      })

      -- Resaltar automáticamente la palabra bajo el cursor
      require("mini.cursorword").setup({ delay = 100 })

      -- Visualizar y operar sobre el scope de indentación
      require("mini.indentscope").setup()

      -- Minimap overview del buffer
      require("mini.map").setup({
        integrations = {
          require("mini.map").gen_integration.builtin_search(),
          require("mini.map").gen_integration.diagnostic(),
          require("mini.map").gen_integration.gitsigns(),
        },
        symbols = {
          encode = require("mini.map").gen_encode_symbols.dot("4x2"),
        },
        window = {
          focusable = false,
          side = "right",
          width = 10,
          winblend = 25,
          zindex = 10,
        },
      })

      -- Toggle minimap
      vim.keymap.set("n", "<leader>mm", function()
        require("mini.map").toggle()
      end, { desc = "toggle minimap" })

      -- Abrir minimap automáticamente al iniciar
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          require("mini.map").open()
        end,
      })
    end,
  },
}
