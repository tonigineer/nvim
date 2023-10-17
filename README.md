# Neovim configuration

<kbd>![preview](./assets/preview.png)</kbd>

A [Lazy](https://github.com/folke/lazy.nvim) and [Mason](https://github.com/williamboman/mason.nvim) based [Neovim](https://neovim.io/) configuration with [LSP](https://github.com/neovim/nvim-lspconfig) and [DAP](https://github.com/mfussenegger/nvim-dap) support for:

Language | 📰 LSP | 🪲 DAP
--: | :-: | :-:
Rust |  ✔️ | ✔️
C\C++ |  ✔️ | ✔️
Python |  ✔️ | ✔️
Lua |  ✔️ | ✔️
Bash |  ✔️ | ✖️
Json |  ✔️ | ✖️
Markdown |  ✔️ | ✖️

## 💾 Installation

Install mandatory dependencies and clone the repository:

```sh
pacman -S fd ripgrep
git clone https://github.com/tonigineer/nvim.git ~/.config/nvim
```

## 🔧 Dependencies

In order to make `:checkhealth` completely happy, additional dependencies and setup steps are needed:

```sh
pacman -S 
```
