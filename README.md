# iyioon/nvim

A modular Neovim configuration extended from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Features a clean structure, modern plugins, and sensible defaults for a productive editing experience.

## Installation

### Prerequisites

**Required:**
- [Neovim](https://neovim.io/) 0.10+ (0.11+ recommended) - `brew install neovim`
- Git - `brew install git`
- A C compiler (`gcc` or `clang`) - `brew install gcc`
- `make` (for building some plugins) - `brew install make`
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) 0.26.1+ - required for nvim-treesitter parser installation - `brew install tree-sitter-cli`
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation) - `brew install ripgrep`
- [fd](https://github.com/sharkdp/fd#installation) - `brew install fd`
- `curl` - for downloading packages (Mason, Treesitter)
- `tar`, `gzip`, `unzip` - for extracting packages (Mason, Treesitter)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons) - `brew install --cask font-hack-nerd-font`

**Recommended:**
- [Node.js](https://nodejs.org/) v22+ - required for Copilot and many LSP servers (css-lsp, html-lsp, pyright, tsserver) - `brew install node`

**Optional:**
- [lazygit](https://github.com/jesseduffield/lazygit#installation) - for Git UI (`<leader>gg`) - `brew install lazygit`
- Python - for Python development - `brew install python`
- Java Runtime (JRE/JDK) - if using Java LSP (jdtls)

**Install all (Homebrew):**
```bash
# Required
brew install neovim git gcc make tree-sitter-cli ripgrep fd curl
brew install --cask font-hack-nerd-font

# Recommended
brew install node  # v22+ for Copilot and LSP servers

# Optional
brew install lazygit python
```

### Clean Install (Remove Existing Config)

If you have an existing Neovim configuration, back it up and remove it first.

<details><summary>Linux / macOS</summary>

```bash
# Backup (optional)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Remove completely
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

</details>

<details><summary>Windows (PowerShell)</summary>

```powershell
# Backup (optional)
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# Remove completely
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data
```

</details>

> Reference: [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling)

### Clone the Configuration

<details><summary>Linux / macOS</summary>

```bash
git clone https://github.com/iyioon/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary>Windows (cmd.exe)</summary>

```cmd
git clone https://github.com/iyioon/nvim.git "%localappdata%\nvim"
```

</details>

<details><summary>Windows (PowerShell)</summary>

```powershell
git clone https://github.com/iyioon/nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post-Installation

1. Start Neovim: `nvim`
2. Lazy.nvim will automatically install all plugins
3. Run `:Lazy` to check plugin status
4. Run `:Mason` to manage LSP servers

### Install Recipes

<details><summary>macOS (Homebrew)</summary>

```bash
brew install neovim git gcc make tree-sitter-cli ripgrep fd lazygit curl node
brew install --cask font-hack-nerd-font
```

</details>

<details><summary>Ubuntu / Debian</summary>

```bash
# Add Neovim PPA for latest version
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl neovim fd-find

# tree-sitter CLI (required for nvim-treesitter)
cargo install tree-sitter-cli
# Or via npm: npm install -g tree-sitter-cli

# Node.js v22+ (for Copilot and LSP servers)
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

</details>

<details><summary>Fedora</summary>

```bash
sudo dnf install -y gcc make git ripgrep fd-find unzip curl xclip neovim nodejs

# tree-sitter CLI (required for nvim-treesitter)
cargo install tree-sitter-cli
# Or via npm: npm install -g tree-sitter-cli
```

</details>

<details><summary>Arch Linux</summary>

```bash
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip curl xclip neovim nodejs npm tree-sitter
```

</details>

<details><summary>Windows (Chocolatey)</summary>

Run as Administrator:

```cmd
choco install -y neovim git ripgrep wget fd unzip gzip mingw make curl nodejs

# tree-sitter CLI (required for nvim-treesitter)
npm install -g tree-sitter-cli
```

Then install a [Nerd Font](https://www.nerdfonts.com/font-downloads) manually or via:
```cmd
choco install -y nerd-fonts-hack
```

</details>

<details><summary>WSL (Windows Subsystem for Linux)</summary>

```bash
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl neovim fd-find

# tree-sitter CLI (required for nvim-treesitter)
cargo install tree-sitter-cli
# Or via npm: npm install -g tree-sitter-cli

# Node.js v22+ (for Copilot and LSP servers)
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

</details>

## Features

### Editor
- **Treesitter** - Syntax highlighting and code understanding
- **Telescope** - Fuzzy finder for files, grep, LSP, and more
- **Blink.cmp** - Fast autocompletion with LSP and snippets
- **LuaSnip** - Snippet engine with friendly-snippets
- **Which-Key** - Keymap hints popup
- **Mini.nvim** - Text objects, surround, statusline

### LSP & Formatting
- **Mason** - Auto-install LSP servers, formatters, linters
- **nvim-lspconfig** - LSP configuration (Neovim 0.11+ native API)
- **Conform** - Code formatting with per-filetype formatters
- **Fidget** - LSP progress notifications

### UI
- **Cyberdream** - Color scheme with transparency support
- **Lualine** - Statusline
- **Snacks.nvim** - Dashboard, indent guides, smooth scroll
- **nvim-ufo** - Modern folding with LSP/Treesitter
- **Todo-comments** - Highlight TODO, FIXME, NOTE comments

### File Management
- **Neo-tree** - File tree explorer
- **Oil.nvim** - Edit filesystem like a buffer
- **Window-picker** - Select target window for opening files

### Git
- **LazyGit** - Full Git UI in a floating terminal
- **Gitsigns** - Git status in the gutter

### Navigation
- **Flash.nvim** - Quick jump navigation
- **Easy-align** - Text alignment
- **nvim-ts-autotag** - Auto-close HTML/XML tags

### Language Support
- **Markdown** - Browser preview, in-buffer rendering, bullet auto-increment

### AI
- **GitHub Copilot** - AI code suggestions

## Keybindings

Leader key: `<Space>`

### General

| Key | Description |
|-----|-------------|
| `<Esc>` | Clear search highlights |
| `<leader>q` | Open diagnostic quickfix list |
| `]q` / `[q` | Next / previous quickfix item |
| `<leader>bd` | Delete (close) buffer |
| `<C-h/j/k/l>` | Navigate between windows |
| `<leader>ts` | Toggle spell check |

### Search (Telescope)

| Key | Description |
|-----|-------------|
| `<leader>sf` | Search files |
| `<leader>sg` | Search by grep (multigrep*) |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sw` | Search current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Search recent files |
| `<leader>ss` | Search Telescope builtins |
| `<leader>s/` | Search in open files |
| `<leader>sn` | Search Neovim config files |
| `<leader><leader>` | Find open buffers |
| `<leader>/` | Fuzzy search in current buffer |

> *Multigrep: Type search query, then **two spaces**, then file pattern.
> Example: `function  *.lua` searches "function" in .lua files only.

### LSP

| Key | Description |
|-----|-------------|
| `grn` | Rename symbol |
| `gra` | Code action |
| `grr` | Go to references |
| `gri` | Go to implementation |
| `grd` | Go to definition |
| `grD` | Go to declaration |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `<leader>f` | Format buffer |
| `<leader>th` | Toggle inlay hints |

### File Explorer

| Key | Description |
|-----|-------------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>E` | Open Oil (edit filesystem) |
| `<leader>o` | Focus Neo-tree |
| `<leader>wp` | Window picker |

### Git

| Key | Description |
|-----|-------------|
| `<leader>gg` | Open LazyGit |
| `<leader>gl` | LazyGit log view |
| `<leader>gf` | LazyGit file history |

### Navigation & Editing

| Key | Description |
|-----|-------------|
| `s` | Flash jump |
| `S` | Flash treesitter select |
| `ga` | Align text (EasyAlign) |
| `gsa` | Add surround |
| `gsd` | Delete surround |
| `gsr` | Replace surround |

### Folding

| Key | Description |
|-----|-------------|
| `za` | Toggle fold |
| `zR` | Open all folds |
| `zM` | Close all folds |

### Color Picker

| Key | Description |
|-----|-------------|
| `<leader>cp` | Open color picker |
| `<leader>cc` | Convert color format |
| `<leader>ch` | Toggle color highlighter |

### Copilot

| Key | Description |
|-----|-------------|
| `<C-l>` | Accept suggestion (insert mode) |
| `<M-]>` / `<M-[>` | Next / previous suggestion |
| `<C-]>` | Dismiss suggestion |
| `<leader>tp` | Toggle Copilot |

### Toggles

| Key | Description |
|-----|-------------|
| `<leader>tc` | Toggle treesitter context |
| `<leader>th` | Toggle inlay hints (LSP) |
| `<leader>tz` | Toggle zen mode |
| `<leader>ts` | Toggle spell check |
| `<leader>tp` | Toggle Copilot |

### Markdown

| Key | Description |
|-----|-------------|
| `<leader>mp` | Toggle browser preview |
| `<leader>mr` | Toggle in-buffer render |

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── core/                   # Core configuration
│   │   ├── options.lua         # Vim options
│   │   ├── keymaps.lua         # Global keymaps
│   │   ├── autocmds.lua        # Autocommands
│   │   └── lazy.lua            # Plugin manager bootstrap
│   ├── config/                 # Configuration data
│   │   └── lsp_servers.lua     # LSP server definitions
│   └── plugins/                # Plugin specifications
│       ├── editor/             # Treesitter, Telescope, completion
│       ├── lsp/                # LSP, Mason, formatting
│       ├── ui/                 # Theme, statusline, dashboard
│       ├── lang/               # Language-specific (Markdown, etc.)
│       └── tools/              # Git, terminal, file explorer
└── snippets/                   # Custom snippets
```

## Customization

### Adding Plugins

Create a new `.lua` file in the appropriate `lua/plugins/` subdirectory:

```lua
-- lua/plugins/tools/my-plugin.lua
return {
  'author/plugin-name',
  opts = {
    -- plugin options
  },
}
```

### Adding LSP Servers

Edit `lua/config/lsp_servers.lua`:

```lua
return {
  lua_ls = { ... },
  pyright = {},
  -- Add your server here:
  rust_analyzer = {},
}
```

Then add the server to the `ensure_installed` list in `lua/plugins/lsp/init.lua`.

## Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Original base configuration
- [lazy.nvim](https://lazy.folke.io/) - Plugin manager
- [Mason.nvim](https://github.com/mason-org/mason.nvim) - LSP/tool installer
- [The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)
