# Neovim Configuration

This is my Neovim setup, built upon the starter template from [LazyVim](https://github.com/LazyVim/LazyVim). For more details and installation instructions, refer to the official [LazyVim documentation](https://lazyvim.github.io/installation).

## 💾 Installation

To install the necessary dependencies and clone the configuration repository, follow these steps:

```sh
pacman -S fd ripgrep zip npm python-pip luarocks python-neovim-git
git clone https://github.com/tonigineer/nvim.git ~/.config/nvim
```

### 🔧 Dependencies

To ensure `:checkhealth` in Neovim passes without errors, you'll need to install some additional dependencies and perform a few setup steps:

```sh
# Install Rust (required for some plugins)
rustup default stable

# Install Treesitter CLI (for syntax highlighting and more)
sudo pacman -S yarn
yarn global add tree-sitter-cli
cargo install tree-sitter-cli
sudo npm install -g tree-sitter-cli
```

> [!NOTE]
> This guide might not cover all potential issues, as I may have fixed some dependencies directly on my machine without updating this document.