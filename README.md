# Neovim Configuration

Noteable features: [LSP](https://github.com/neovim/nvim-lspconfig), [DAP](https://github.com/mfussenegger/nvim-dap), [which-key](https://github.com/folke/which-key.nvim), [toogleterm](https://github.com/akinsho/toggleterm.nvim), [lazygit](https://github.com/kdheepak/lazygit.nvim)

## Dependencies

```sh
sudo pacman -S --needed \
  fd ripgrep zip npm python-pip luarocks python-neovim-git
```

## Installation

To install the necessary dependencies and clone the configuration repository, follow
these steps:

```sh
git clone https://github.com/tonigineer/nvim.git ~/.config/nvim
```

## Health check

Some plugins require the Tree-sitter CLI.

```sh
rustup default stable
cargo install tree-sitter-cli
```

## Colorscheme

The colorscheme is set to `:colorscheme m3scheme`, which hot-reloads colors from
[Caelestia-Cli](https://github.com/caelestia-dots/cli) at:

```sh
~/.local/state/caelestia/scheme.json
```

To switch the colorscheme, change it in `set.lua` and uncomment the workaround
in `init.lua` as shown below.

```sh
~/.config/nvim/lua/tonigineer
├─ init.lua
├─ set.lua
└─ colors/m3scheme.lua
```
