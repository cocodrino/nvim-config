return {
  {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_motion_enabled = 1
      vim.g.matchup_delim_noskips = 0
    end,
  },
}
