return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      -- Extender f/F/t/T para saltar entre líneas y repetir con ; ,
      require("mini.jump").setup()

      -- Animaciones suaves de scroll, cursor, etc.
      require("mini.animate").setup()

      -- Resaltar automáticamente la palabra bajo el cursor
      require("mini.cursorword").setup({ delay = 100 })

      -- Visualizar y operar sobre el scope de indentación
      require("mini.indentscope").setup()
    end,
  },
}
