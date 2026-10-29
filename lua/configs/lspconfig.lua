require("nvchad.configs.lspconfig").defaults()

-- Re-enable LSP semantic tokens (NvChad los desactiva por defecto)
vim.lsp.config("*", { on_init = function(_, _) end })

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

local pyright_bin = vim.fn.exepath "pyright-langserver"
if pyright_bin == "" then
  pyright_bin = "pyright-langserver"
end

local pyright_config = {
  name = "pyright",
  cmd = { pyright_bin, "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git", "pyrightconfig.json" },
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoImportCompletions = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

vim.lsp.config("pyright", pyright_config)
vim.lsp.enable("pyright")

-- Attach a buffers Python ya abiertos
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.bo[buf].filetype == "python" and #vim.lsp.get_clients({ bufnr = buf, name = "pyright" }) == 0 then
    vim.lsp.start(pyright_config, { bufnr = buf })
  end
end

local ts_ls_bin = vim.fn.exepath "typescript-language-server"
if ts_ls_bin == "" then
  ts_ls_bin = "typescript-language-server"
end

local ts_ls_config = {
  name = "ts_ls",
  cmd = { ts_ls_bin, "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  single_file_support = true,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.enable("ts_ls")

-- Attach a buffers TS/JS ya abiertos
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  local ft = vim.bo[buf].filetype
  if vim.tbl_contains(ts_ls_config.filetypes, ft) and #vim.lsp.get_clients({ bufnr = buf, name = "ts_ls" }) == 0 then
    vim.lsp.start(ts_ls_config, { bufnr = buf })
  end
end

-- Kotlin: LSP oficial de JetBrains (motor IntelliJ). Alpha, pero muy superior a fwcd.
-- Fallback: si falla, cambia el binario a "kotlin-language-server" y quita "--stdio".
local kotlin_bin = vim.fn.exepath "kotlin-lsp"
if kotlin_bin == "" then
  kotlin_bin = "kotlin-lsp"
end

local kotlin_config = {
  name = "kotlin_lsp",
  cmd = { kotlin_bin, "--stdio" },
  filetypes = { "kotlin" },
  root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", "pom.xml", ".git" },
  single_file_support = true,
}

vim.lsp.config("kotlin_lsp", kotlin_config)
vim.lsp.enable("kotlin_lsp")

-- Attach a buffers Kotlin ya abiertos
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.bo[buf].filetype == "kotlin" and #vim.lsp.get_clients({ bufnr = buf, name = "kotlin_lsp" }) == 0 then
    vim.lsp.start(kotlin_config, { bufnr = buf })
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP " .. desc })
    end

    map("gr", vim.lsp.buf.references, "references")
    map("<leader>ca", vim.lsp.buf.code_action, "code action")
    map("]d", vim.diagnostic.goto_next, "next diagnostic")
    map("[d", vim.diagnostic.goto_prev, "prev diagnostic")

    -- Grupo LSP bajo <leader>l
    map("<leader>ld", vim.lsp.buf.definition, "definition")
    map("<leader>lD", vim.lsp.buf.declaration, "declaration")
    map("<leader>lr", vim.lsp.buf.references, "references")
    map("<leader>lt", vim.lsp.buf.type_definition, "type definition")
    map("<leader>lR", vim.lsp.buf.rename, "rename")
    map("<leader>la", vim.lsp.buf.code_action, "code action")
    map("<leader>ll", vim.diagnostic.setloclist, "diagnostic loclist")
    map("<leader>ln", vim.diagnostic.goto_next, "next diagnostic")
    map("<leader>lp", vim.diagnostic.goto_prev, "prev diagnostic")
    map("<leader>ls", function()
      require("lsp_signature").toggle_float_win()
    end, "toggle signature help")

    -- Limpiar atajos redundantes dejados por el default de NvChad
    pcall(vim.keymap.del, "n", "<leader>D", { buffer = buf })
    pcall(vim.keymap.del, "n", "<leader>ra", { buffer = buf })
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
