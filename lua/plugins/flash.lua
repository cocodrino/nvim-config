return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      -- Sin etiquetas hasta 2+ letras: evita que tras "e" no puedas seguir con "xpect"
      label = {
        -- Etiquetas solo con 3+ letras (tras "e"/"ex" sigues escribiendo)
        min_pattern_length = 3,
      },
      search = {
        -- Solo inicio de palabra + texto literal (expect, export, etc.)
        multi_window = false,
        mode = function(str)
          if str == "" then
            return ""
          end
          return "\\<" .. vim.pesc(str)
        end,
      },
      jump = {
        -- Si solo queda un match (p. ej. "expect"), salta sin etiqueta
        autojump = true,
      },
      modes = {
        char = { enabled = true },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash jump",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc = "Flash treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Flash remote",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Flash treesitter search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle flash search",
      },
    },
  },
}

