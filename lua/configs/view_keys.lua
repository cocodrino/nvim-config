-- Reenvía una tecla que solo existe dentro de la vista de un plugin
-- (DiffBandit, Atlas), para poder lanzarla desde un atajo <leader> con nombre
-- en which-key. Si la ventana actual no tiene esa tecla, avisa en vez de
-- ejecutar el comportamiento normal de Vim (p. ej. `u` = deshacer).
local M = {}

---@param plugin string nombre que se muestra en el aviso
---@param lhs string tecla tal como la mapea el plugin (p. ej. "]c", ">>")
function M.feed(plugin, lhs)
  return function()
    local map = vim.fn.maparg(lhs, "n", false, true)
    if vim.tbl_isempty(map) or map.buffer ~= 1 then
      vim.notify(
        string.format("%s: '%s' solo funciona dentro de una vista de %s", plugin, lhs, plugin),
        vim.log.levels.WARN
      )
      return
    end
    vim.api.nvim_feedkeys(vim.keycode(lhs), "m", false)
  end
end

--- Construye specs `keys` de lazy.nvim: { sufijo, tecla_original, descripción }.
---@param plugin string
---@param prefix string p. ej. "<leader>gd"
---@param list { [1]: string, [2]: string, [3]: string }[]
function M.keys(plugin, prefix, list)
  local specs = {}
  for _, item in ipairs(list) do
    table.insert(specs, { prefix .. item[1], M.feed(plugin, item[2]), desc = item[3] })
  end
  return specs
end

return M
