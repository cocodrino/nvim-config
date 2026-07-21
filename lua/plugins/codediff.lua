return {
  {
    "esmuellert/codediff.nvim",
    config = function()
      require("codediff").setup {}
    end,
    keys = {
      {
        "<leader>gDs",
        "<cmd>CodeDiff<cr>",
        desc = "codediff git status explorer",
      },
      {
        "<leader>gDh",
        "<cmd>CodeDiff history<cr>",
        desc = "codediff history",
      },
      {
        "<leader>gDc",
        "<cmd>CodeDiff history %<cr>",
        desc = "codediff history current file",
      },
      {
        "<leader>gDf",
        "<cmd>CodeDiff file HEAD<cr>",
        desc = "codediff current file vs HEAD",
      },
      {
        "<leader>gDb",
        function()
          vim.ui.input({ prompt = "CodeDiff branch/commit: " }, function(input)
            if input and input ~= "" then
              vim.cmd("CodeDiff " .. input)
            end
          end)
        end,
        desc = "codediff compare branch/commit",
      },
      {
        "<leader>gDr",
        function()
          vim.ui.input({ prompt = "CodeDiff range (a b): " }, function(input)
            if input and input ~= "" then
              vim.cmd("CodeDiff " .. input)
            end
          end)
        end,
        desc = "codediff compare range",
      },
    },
  },
}
