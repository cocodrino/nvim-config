> A batteries-included Neovim configuration built on top of [NvChad](https://github.com/NvChad/NvChad).

# Neovim Config

This is an opinionated Neovim setup that extends NvChad with extra plugins for navigation, LSP, Git, terminal management, and UI enhancements.

## What gets backed up?

Only `~/.config/nvim` needs to be version-controlled. With `lazy.nvim`, plugins are downloaded automatically on the first launch into `~/.local/share/nvim/lazy/`. The included `lazy-lock.json` pins the exact versions of every plugin, so the setup is reproducible.

You do **not** need to back up `~/.local/share/nvim` unless you want to avoid re-downloading plugins.

## Requirements

- Neovim **0.9+** (0.11+ recommended)
- `git`
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- A C compiler for `nvim-treesitter` (macOS already ships `clang`; on Linux install `gcc` / `build-essential`)
- `npm` if you want the pre-configured language servers:
  - Python: `npm install -g pyright`
  - TypeScript/JavaScript: `npm install -g typescript-language-server`

## Installation / Restore

1. Back up your current Neovim config (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository into `~/.config/nvim`:

   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. Start Neovim:

   ```bash
   nvim
   ```

   `lazy.nvim` will install NvChad and all the configured plugins automatically. Wait for it to finish, then restart Neovim.

4. Install the language servers you need:

   ```bash
   npm install -g pyright typescript-language-server
   ```

## Included plugins

- **LSP**: `nvim-lspconfig` with `pyright`, `ts_ls`, `html`, `cssls`
- **Fuzzy finder**: `telescope.nvim` + `project.nvim` extension
- **Git**: `gitsigns.nvim`, `codediff.nvim`, `git-worktree.nvim`
- **Navigation**: `flash.nvim`, `harpoon`, `mini.jump`
- **Editing**: `mini.nvim` modules (`jump`, `animate`, `cursorword`, `indentscope`)
- **UI/UX**: `noice.nvim`, `nvim-notify`
- **File tree**: `nvim-tree.lua`
- **Terminal**: `nvchad.term` with custom keymaps

## Keymap groups

`<leader>` is `<Space>`.

| Group | Prefix | Description |
|-------|--------|-------------|
| Telescope | `<leader>f` | Find files, keymaps, commands, registers, git pickers, projects |
| Git | `<leader>g` | Git pickers and commands |
| CodeDiff | `<leader>gD` | Git diff explorer |
| Console | `<leader>hc` | Terminal management |
| Harpoon | `<leader>hp` | Pin and jump between files |
| LSP | `<leader>l` | Go to definition, references, rename, code actions, diagnostics |
| Tree | `<leader>t` | File tree |
| Workspace | `<leader>w` | Git worktrees |

Check `lua/mappings.lua` and the files under `lua/plugins/` for the full keymap list.

## Customization

All custom configuration lives in `lua/`. Edit the files you want, restart Neovim, and the changes will take effect.

If you fork this repository, commit your changes there and keep your own backup.

## License

This repository retains the license of the original NvChad starter.
