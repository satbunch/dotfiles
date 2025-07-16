# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for managing Linux development environment configuration files. The repository contains configuration for:

- **Neovim**: Modern text editor with LSP support
- **Tmux**: Terminal multiplexer  
- **Zsh**: Shell configuration with aliases and functions
- **Starship**: Cross-shell prompt customization
- **Lazygit**: Terminal UI for git commands
- **Alacritty**: Terminal emulator

## Configuration Structure

### Neovim Configuration
- **Location**: `.config/nvim/`
- **Entry point**: `init.lua` loads core modules
- **Plugin manager**: Lazy.nvim
- **Core modules**:
  - `lua/core/keymaps.lua`: Key mappings (leader key: space)
  - `lua/core/options.lua`: Vim options
  - `lua/core/lazy.lua`: Plugin manager setup
- **Plugins**: Located in `lua/plugins/` directory
  - LSP configuration with Mason for package management
  - Telescope for fuzzy finding
  - Treesitter for syntax highlighting
  - Auto-session, zen-mode, toggleterm, and other productivity plugins

### Tmux Configuration
- **Location**: `.config/tmux/.tmux.conf`
- **Prefix key**: `Ctrl+q` (changed from default `Ctrl+b`)
- **Key bindings**:
  - `v`: vertical split
  - `s`: horizontal split
  - `h/j/k/l`: vim-like pane navigation
  - `Alt+hjkl`: pane resizing
- **Plugins**: TPM (Tmux Plugin Manager) with prefix-highlight

### Shell Configuration
- **Zsh config**: `.config/zsh/.zshrc`
- **Aliases**: `vi/vim/view` → `nvim`, `ls` → `eza --icons`
- **Functions**: `lg()` for lazygit
- **Prompt**: Starship prompt configured in `.config/starship.toml`

## No Build/Test Commands

This dotfiles repository does not contain traditional build, test, or lint commands as it consists of configuration files rather than source code. The configurations are applied by:

1. Symlinking or copying files to appropriate locations
2. Installing required packages/plugins through their respective package managers
3. Sourcing shell configurations

## Common Tasks

### Neovim Plugin Management
- Install/update plugins: `:Lazy` command within Neovim
- LSP server management: `:Mason` command within Neovim

### Tmux Plugin Management
- Install plugins: `prefix + I` in tmux session
- Update plugins: `prefix + U` in tmux session

### Shell Configuration
- Reload zsh config: `source ~/.config/zsh/.zshrc` or restart terminal
- Starship prompt updates: Edit `.config/starship.toml` and restart terminal

## Important Notes

- The repository uses a modern Neovim configuration with Lua
- LSP servers are managed through Mason
- Terminal experience is enhanced with Starship prompt and eza for file listings
- Tmux is configured for vim-like navigation and productivity
- All configurations follow a cohesive color scheme and workflow