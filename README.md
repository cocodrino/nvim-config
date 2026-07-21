# nvim-config

Configuración personal de Neovim basada en [NvChad](https://github.com/NvChad/NvChad).

## ¿Solo se respalda `~/.config/nvim`?

Sí. Con NvChad + `lazy.nvim`, **solo hace falta respaldar `~/.config/nvim`**. Los plugins se descargan automáticamente en el primer arranque en `~/.local/share/nvim/lazy/`, y el archivo `lazy-lock.json` de este repo fija las versiones exactas de cada plugin.

No es necesario respaldar `~/.local/share/nvim` a menos que quieras evitar volver a descargar todo.

## Requisitos

- Neovim **0.9+** (recomendado 0.11+)
- `git`
- Una [Nerd Font](https://www.nerdfonts.com/)
- Un compilador de C para `nvim-treesitter` (macOS ya trae `clang`, en Linux instala `gcc`/`build-essential`)
- `npm` para los language servers que usas:
  - Python: `npm install -g pyright`
  - TypeScript/JavaScript: `npm install -g typescript-language-server`

## Cómo restaurar esta configuración

1. Haz un backup de tu config actual (si la tienes):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clona este repo en `~/.config/nvim`:

   ```bash
   git clone git@github.com:cocodrino/nvim-config.git ~/.config/nvim
   ```

3. Abre Neovim:

   ```bash
   nvim
   ```

   `lazy.nvim` instalará automáticamente NvChad y todos los plugins. Espera a que termine y luego cierra/reinicia `nvim`.

4. Verifica que los language servers estén instalados:

   ```bash
   npm install -g pyright typescript-language-server
   ```

## Qué incluye esta config

- **NvChad** como base (UI, tema, statusline, nvim-tree, etc.).
- **LSP**: `pyright`, `ts_ls`, `html`, `cssls`.
- **Telescope**: keymaps, comandos, registros, git, símbolos, proyectos.
- **Git**: `gitsigns`, `codediff.nvim`, `git-worktree.nvim`.
- **Navegación**: `flash.nvim`, `harpoon`, `mini.jump`.
- **UI/UX**: `noice.nvim`, `nvim-notify`, `mini.animate`, `mini.cursorword`, `mini.indentscope`.
- **Terminal**: atajos bajo `<leader>hc`.
- **Proyectos**: `project.nvim` con `Telescope projects`.

## Atajos principales

`<leader>` es `<Espacio>`.

| Grupo | Prefijo | Descripción |
|-------|---------|-------------|
| Telescope | `<leader>f` | Búsquedas y pickers |
| Git | `<leader>g` | Comandos git |
| CodeDiff | `<leader>gD` | Diff de git |
| Console | `<leader>hc` | Terminal |
| Harpoon | `<leader>hp` | Archivos fijados |
| LSP | `<leader>l` | Acciones de lenguaje |
| Tree | `<leader>t` | Nvim-tree |
| Workspace | `<leader>w` | Git worktrees |

Para ver la tabla completa, revisa `lua/mappings.lua` y los archivos dentro de `lua/plugins/`.

## Actualizar el respaldo

Cuando hagas cambios en tu config local, actualiza el repo con:

```bash
rsync -av --exclude=.git ~/.config/nvim/ /ruta/a/nvim-config/
cd /ruta/a/nvim-config
git add -A
git commit -m "backup: sync nvim config"
git push origin main
```
