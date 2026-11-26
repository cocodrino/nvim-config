-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "jabuti",
	transparency = true,

	hl_override = {
		-- Parámetro, campo y tipo dejan de compartir el rosa de ayu/jabuti.
		["@variable.parameter"] = { fg = "#efb993" },
		["@variable.member"] = { fg = "#ff7eb6" },
		["@property"] = { fg = "#ff7eb6" },
		["@type"] = { fg = "#e1c697" },
		["@type.definition"] = { fg = "#e1c697" },
		["@lsp.type.parameter"] = { fg = "#efb993" },
		["@lsp.type.property"] = { fg = "#ff7eb6" },
		["@lsp.type.method"] = { fg = "#3FC6DE" },
		["@function.method"] = { fg = "#3FC6DE" },
		["@function.method.call"] = { fg = "#3FC6DE" },
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
