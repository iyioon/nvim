# iyioon/nvim

Neovim configuration for Neovim `0.12.1+`.

The setup is organized by concern, uses `lazy.nvim` for plugin management, and keeps a practical coding workflow around LSP, Treesitter, Telescope, Git, Markdown, and a few focused UI plugins.

## Quick Start

### Requirements

- Neovim `0.12.1+`
- Git
- C compiler (`gcc` or `clang`)
- `make`
- `ripgrep`
- `fd`
- `curl`, `tar`, `gzip`, `unzip`
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) `0.26.1+`
- Nerd Font for icons

Recommended:

- Node.js `v22+` for Copilot and Node-based LSP servers
- Python for Python development
- LazyGit for Git UI

macOS example:

```bash
brew install neovim git gcc make tree-sitter-cli ripgrep fd curl
brew install node lazygit python
brew install --cask font-hack-nerd-font
```

Linux:

- install the same tools through your package manager
- install `tree-sitter-cli` from your system package manager or another non-`npm` source

Windows:

- install Neovim, Git, compiler tools, `ripgrep`, `fd`, and Node.js through your usual package source
- install `tree-sitter-cli` from a non-`npm` source before first startup
- install a Nerd Font manually

### Install

```bash
git clone https://github.com/iyioon/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

On Windows PowerShell:

```powershell
git clone https://github.com/iyioon/nvim.git "${env:LOCALAPPDATA}\nvim"
```

### First Launch

1. Start Neovim with `nvim`.
2. Let `lazy.nvim` install plugins.
3. Run `:Lazy` to inspect plugin status.
4. Run `:Mason` to inspect installed tools.
5. Run `:checkhealth` if anything looks off.

Plugin revisions are tracked in `lazy-lock.json`. On another machine, `:Lazy restore` will align plugins to the committed state.

## What You Get

### Editing

- Treesitter for syntax-aware highlighting and indentation
- Telescope for search, grep, buffers, commands, and help
- Blink completion with LuaSnip snippets
- Builtin Neovim `0.12` incremental selection on Visual `an` / `in`
- Mini textobjects and surround mappings
- Guess-indent and autopairs

### LSP and Formatting

- `nvim-lspconfig` using the Neovim `0.12` API
- Mason, Mason LSP config, and Mason tool installer
- Conform for formatting
- Fidget for LSP progress

### UI

- Cyberdream colorscheme
- Lualine statusline
- Snacks dashboard, indent guides, smooth scrolling, and LazyGit integration
- UFO folding and Treesitter context
- Todo-comments and zen mode

### Files, Git, and Extras

- Oil and Neo-tree for file navigation
- Window-picker for targeted window opens
- Gitsigns
- Flash, EasyAlign, and autotag
- Markdown preview and render helpers
- Copilot
- CCC color tools

## Important Keys

Leader key: `<Space>`

### General

| Key | Description |
|-----|-------------|
| `<leader>bd` | Close buffer |
| `<leader>q` | Open diagnostics list |
| `<leader>uu` | Toggle builtin undo tree |
| `<C-h/j/k/l>` | Move between windows |
| `<leader>ts` | Toggle spell check |

### Search

| Key | Description |
|-----|-------------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep with optional file glob |
| `<leader>sh` | Help tags |
| `<leader>sd` | Diagnostics |
| `<leader><leader>` | Open buffers |
| `<leader>/` | Search current buffer |

For `<leader>sg`, type the search, then two spaces, then a file glob.
Example: `function  *.lua`

### LSP

| Key | Description |
|-----|-------------|
| `grd` | Definition |
| `grr` | References |
| `gri` | Implementation |
| `grn` | Rename |
| `gra` | Code action |
| `<leader>f` | Format buffer |
| `<leader>th` | Toggle inlay hints |
| `<leader>tl` | Toggle LSP |

### Files and Git

| Key | Description |
|-----|-------------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>o` | Focus Neo-tree |
| `<leader>E` | Open Oil |
| `<leader>wp` | Pick target window |
| `<leader>gg` | Open LazyGit |
| `<leader>gl` | LazyGit log |
| `<leader>gf` | LazyGit file history |

### Navigation and Toggles

| Key | Description |
|-----|-------------|
| `s` | Flash jump |
| `S` | Flash Treesitter jump |
| Visual `an` / `in` | Incremental Treesitter or LSP selection |
| `ga` | EasyAlign |
| `gsa` / `gsd` / `gsr` | Surround add, delete, replace |
| `zR` / `zM` | Open or close all folds |
| `<leader>tc` | Toggle Treesitter context |
| `<leader>tz` | Toggle zen mode |
| `<leader>tp` | Toggle Copilot |

### Markdown

| Key | Description |
|-----|-------------|
| `<leader>mp` | Toggle browser preview |
| `<leader>mr` | Toggle in-buffer render |

## Project Layout

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── core/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── autocmds.lua
│   │   └── lazy.lua
│   ├── config/
│   │   └── lsp_servers.lua
│   └── plugins/
│       ├── editor/
│       ├── lsp/
│       ├── ui/
│       ├── lang/
│       └── tools/
└── snippets/
```

Directory roles:

- `core/`: base editor behavior and plugin bootstrap
- `config/`: shared configuration data
- `plugins/`: lazy.nvim specs grouped by feature area
- `snippets/`: custom LuaSnip snippets

## Maintenance

### Plugins

- `:Lazy` shows plugin state
- `:Lazy sync` installs, cleans, and updates plugins
- `:Lazy restore` restores plugin revisions from `lazy-lock.json`

### Tools

- `:Mason` manages installed LSP servers and external tools
- `lua/plugins/lsp/init.lua` holds the Mason install list
- `lua/config/lsp_servers.lua` holds server-specific overrides

### Health Checks

- `:checkhealth`
- `:checkhealth lazy`
- `:checkhealth vim.lsp`
- `:checkhealth nvim-treesitter`

## Customization

### Add a Plugin

Create a file under the appropriate `lua/plugins/` directory:

```lua
return {
  'author/plugin-name',
  opts = {},
}
```

### Add or Change an LSP Server

Edit `lua/config/lsp_servers.lua`:

```lua
return {
  lua_ls = {},
  pyright = {},
  rust_analyzer = {},
}
```

Then add the matching Mason package to `ensure_installed` in `lua/plugins/lsp/init.lua`.

## Resources

- [Neovim documentation](https://neovim.io/doc/)
- [lazy.nvim](https://lazy.folke.io/)
- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
