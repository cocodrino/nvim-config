-- atlas.nvim: PRs, issues y pipelines de GitHub dentro de nvim (usa `gh`).
-- Todo vive bajo <leader>ga.

-- Los remotos usan alias SSH de ~/.ssh/config (github.com-personal,
-- github.com-venflow) para elegir cuenta. Atlas no los reconoce como GitHub,
-- así que se normalizan a github.com solo para su detección; git sigue
-- usando el alias real.
local function patch_ssh_aliases()
  local providers = require "atlas.providers"
  local resolve = providers.resolve
  providers.resolve = function(value, opts)
    if type(value) == "string" then
      value = value:gsub("^(%w+@github%.com)%-[%w_.-]+:", "%1:"):gsub("^(ssh://[^/]-github%.com)%-[%w_.-]+/", "%1/")
    end
    return resolve(value, opts)
  end
end

return {
  {
    "emrearmagan/atlas.nvim",
    cmd = "Atlas",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "esmuellert/codediff.nvim", -- visor de diff para las reviews
    },
    config = function(_, opts)
      patch_ssh_aliases()
      require("atlas").setup(opts)
    end,
    ---@type AtlasConfig
    opts = {
      providers = {
        github = {},
      },
      pulls = {
        diff = {
          open_cmd = "CodeDiff",
        },
      },
      keymaps = {
        pulls = {
          review = {
            -- Por defecto son <leader>ga / gr / gs: <leader>ga choca con este
            -- grupo y <leader>gs con git stash. Se mueven dentro de <leader>ga.
            approve = "<leader>gaA",
            request_changes = "<leader>gaX",
            submit_review = "<leader>gaS",
            -- ]c/[c y - ya son de CodeDiff (hunks y stage) dentro del diff.
            next_comment = "]C",
            prev_comment = "[C",
            toggle_file_reviewed = "<leader>gam",
          },
        },
      },
    },
    keys = vim.list_extend({
      { "<leader>ga<CR>", "<cmd>Atlas<cr>", desc = "atlas menú de comandos" },
      { "<leader>gap", "<cmd>Atlas pulls .<cr>", desc = "atlas PRs del repo" },
      { "<leader>gai", "<cmd>Atlas issues .<cr>", desc = "atlas issues del repo" },
      { "<leader>gar", "<cmd>Atlas review<cr>", desc = "atlas review (elegir PR)" },
      { "<leader>gav", "<cmd>Atlas review .<cr>", desc = "atlas review PR de la rama actual" },
      { "<leader>gac", "<cmd>Atlas create pr<cr>", desc = "atlas crear PR" },
      { "<leader>gaI", "<cmd>Atlas create issue .<cr>", desc = "atlas crear issue" },
      { "<leader>gas", "<cmd>Atlas search .<cr>", desc = "atlas buscar" },
      { "<leader>gao", "<cmd>Atlas open .<cr>", desc = "atlas abrir PR de la rama actual" },
      { "<leader>gab", "<cmd>Atlas browse .<cr>", desc = "atlas navegar repo" },
      { "<leader>gaP", "<cmd>Atlas pipelines .<cr>", desc = "atlas pipelines rama actual" },
      { "<leader>gan", "<cmd>Atlas notes .<cr>", desc = "atlas notas" },
    }, require("configs.view_keys").keys("Atlas", "<leader>gaa", {
      -- <leader>gaa + la misma tecla que dentro de la review (CodeDiff + Atlas).
      { "]C", "]C", "comentario siguiente" },
      { "[C", "[C", "comentario anterior" },
      { "]x", "]x", "hilo sin resolver siguiente" },
      { "[x", "[x", "hilo sin resolver anterior" },
      { "]n", "]n", "nota siguiente" },
      { "[n", "[n", "nota anterior" },
      { "]r", "]r", "commit siguiente" },
      { "[r", "[r", "commit anterior" },
      { "]u", "]u", "archivo sin revisar siguiente" },
      { "[u", "[u", "archivo sin revisar anterior" },
      { "c", "c", "escribir comentario" },
      { "C", "C", "enviar comentario" },
      { "s", "s", "escribir sugerencia" },
      { "S", "S", "enviar sugerencia" },
      { "x", "x", "resolver / reabrir hilo" },
      { "K", "K", "detalles del archivo / commit" },
      { "!", "!", "tipo de nota" },
    })),
  },
}
