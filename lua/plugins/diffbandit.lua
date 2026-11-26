-- Toda la rama actual (commits + staged + unstaged + untracked) contra el punto
-- donde salió de la rama por defecto (origin/HEAD, si no main/master).
-- Mismo flujo que `diffbandit compare` del launcher.
local function diff_current_branch()
  local git = require "diffbandit.git"
  local function fail(msg)
    vim.notify("DiffBandit: " .. (msg or "error"), vim.log.levels.ERROR)
  end

  local root, err = git.root()
  if not root then
    return fail(err or "no es un repositorio git")
  end
  local base_ref
  base_ref, err = git.default_branch(root)
  if not base_ref then
    return fail(err)
  end
  local merge_base
  merge_base, err = git.merge_base(root, base_ref, "HEAD")
  if not merge_base then
    return fail(err or ("sin merge-base con " .. base_ref))
  end

  local ok
  ok, err = require("diffbandit").git_panel {
    root = root,
    mode = "all",
    base = merge_base,
    base_label = "merge-base " .. base_ref,
  }
  if not ok and err then
    fail(err)
  end
end

return {
  {
    "CoreyKaylor/diffbandit.nvim",
    cmd = {
      "DiffBandit",
      "DiffBanditBuffers",
      "DiffBanditFolderDiff",
      "DiffBanditGit",
      "DiffBanditGitCurrent",
      "DiffBanditCommitPanel",
      "DiffBanditGitMenu",
      "DiffBanditGitLog",
      "DiffBanditGitCommit",
      "DiffBanditGitCompare",
      "DiffBanditGitCheckout",
      "DiffBanditMerge",
    },
    opts = {
      -- Por defecto el stage es <Space> con nowait: con leader = Espacio,
      -- dentro de DiffBandit el leader dejaba de funcionar. Se usa "-" (igual que CodeDiff).
      actions = { keys = { toggle_stage = "-" } },
      git = { panel = { keys = { toggle_stage = "-", toggle_amend = "gA" } } },
      folder = { keys = { toggle_expand = "<Tab>" } },
    },
    keys = vim.list_extend({
      {
        "<leader>gdo",
        "<cmd>DiffBanditGit<cr>",
        desc = "diffbandit cambios sin commitear",
      },
      {
        "<leader>gdD",
        diff_current_branch,
        desc = "diffbandit rama actual vs base",
      },
    }, require("configs.view_keys").keys("DiffBandit", "<leader>gdd", {
      -- <leader>gdd + la misma tecla que dentro de la vista, con nombre en which-key.
      { "]c", "]c", "hunk siguiente" },
      { "[c", "[c", "hunk anterior" },
      { "]f", "]f", "archivo siguiente" },
      { "[f", "[f", "archivo anterior" },
      { "]r", "]r", "commit más viejo (review desde log)" },
      { "[r", "[r", "commit más nuevo (review desde log)" },
      { "]s", "]s", "alinear el otro panel al cursor" },
      { "]d", "]d", "ir al final de ambos documentos" },
      { "[d", "[d", "ir al inicio de ambos documentos" },
      { "-", "-", "stage / unstage del hunk o archivo" },
      { ">", ">>", "aplicar izquierda → derecha (merge: quedarse con local)" },
      { "<", "<<", "aplicar derecha → izquierda (merge: quedarse con remoto)" },
      { "u", "u", "deshacer la última acción de DiffBandit" },
      { "C", "C", "abrir / enfocar el panel de commit" },
      { "p", "gzp", "mostrar / ocultar el panel de commit" },
      { "b", "gb", "merge: aceptar ambos lados" },
      { "A", "gA", "merge: aplicar cambios sin conflicto" },
      { "s", "gs", "merge: resolver conflicto simple" },
      { "S", "gS", "merge: resolver todos los simples" },
      { "?", "g?", "ayuda de la ventana actual" },
      { "q", "q", "cerrar la vista" },
    })),
  },
}
