return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>hpa",
        function() require("harpoon"):list():add() end,
        desc = "harpoon add file",
      },
      {
        "<leader>hpm",
        function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
        desc = "harpoon menu",
      },
      {
        "<leader>hp1",
        function() require("harpoon"):list():select(1) end,
        desc = "harpoon file 1",
      },
      {
        "<leader>hp2",
        function() require("harpoon"):list():select(2) end,
        desc = "harpoon file 2",
      },
      {
        "<leader>hp3",
        function() require("harpoon"):list():select(3) end,
        desc = "harpoon file 3",
      },
      {
        "<leader>hp4",
        function() require("harpoon"):list():select(4) end,
        desc = "harpoon file 4",
      },
      {
        "<leader>hpn",
        function() require("harpoon"):list():next() end,
        desc = "harpoon next",
      },
      {
        "<leader>hpp",
        function() require("harpoon"):list():prev() end,
        desc = "harpoon prev",
      },
    },
  },
}
