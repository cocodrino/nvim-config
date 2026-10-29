require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "telescope keymaps" })
map("n", "<leader>fC", "<cmd>Telescope commands<CR>", { desc = "telescope commands" })
map("n", "<leader>fr", "<cmd>Telescope registers<CR>", { desc = "telescope registers" })
map("n", "<leader>fG", "<cmd>Telescope git_branches<CR>", { desc = "telescope git branches" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope document symbols" })
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "telescope projects" })

map("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "git files" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
map("n", "<leader>gB", "<cmd>Telescope git_bcommits<CR>", { desc = "git buffer commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "git branches" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "git status" })
map("n", "<leader>gs", "<cmd>Telescope git_stash<CR>", { desc = "git stash" })

map("n", "<leader>tr", "<cmd>NvimTreeToggle<CR>", { desc = "toggle nvim-tree" })

-- Buffer bajo <leader>b
pcall(vim.keymap.del, "n", "<leader>b")
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<leader>bd", function() require("nvchad.tabufline").close_buffer() end, { desc = "buffer close" })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "buffer list" })
map("n", "<leader>b]", function() require("nvchad.tabufline").next() end, { desc = "buffer next" })
map("n", "<leader>b[", function() require("nvchad.tabufline").prev() end, { desc = "buffer prev" })

-- Ventanas bajo <leader>wi
map("n", "<leader>wiv", "<cmd>vsplit<CR>", { desc = "window split vertical" })
map("n", "<leader>wih", "<cmd>split<CR>", { desc = "window split horizontal" })
map("n", "<leader>wic", "<cmd>close<CR>", { desc = "window close" })
map("n", "<leader>wio", "<cmd>only<CR>", { desc = "window close others" })
map("n", "<leader>wi=", "<C-w>=", { desc = "window equal size" })
map("n", "<leader>wim", "<cmd>wincmd |<CR><cmd>wincmd _<CR>", { desc = "window maximize" })
map("n", "<leader>wir", "<C-w>r", { desc = "window rotate" })
map("n", "<leader>wix", "<C-w>x", { desc = "window exchange" })
map("n", "<leader>wiT", "<C-w>T", { desc = "window move to tab" })

-- Evitar que <leader>h ejecute el atajo por defecto de NvChad (nueva terminal horizontal)
pcall(vim.keymap.del, "n", "<leader>h")

-- Console / terminal bajo <leader>hc
map("n", "<leader>hch", function() require("nvchad.term").new { pos = "sp" } end, { desc = "console new horizontal" })
map("n", "<leader>hcv", function() require("nvchad.term").new { pos = "vsp" } end, { desc = "console new vertical" })
map("n", "<leader>hcf", function() require("nvchad.term").new { pos = "float" } end, { desc = "console new floating" })

map({ "n", "t" }, "<leader>hct", function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, { desc = "console toggle horizontal" })
map({ "n", "t" }, "<leader>hcT", function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end, { desc = "console toggle vertical" })
map({ "n", "t" }, "<leader>hcF", function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end, { desc = "console toggle floating" })

map("n", "<leader>hcc", function() vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true) end, { desc = "console close window" })
map("n", "<leader>hck", function() vim.cmd("bdelete! " .. vim.api.nvim_get_current_buf()) end, { desc = "console kill buffer" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
