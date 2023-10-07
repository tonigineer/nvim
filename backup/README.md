# Neovim configuration

Simple customization of my [Neovim](https://github.com/neovim) setup.

<kbd><img alt="gif of nvim workflow" src="./assets/preview.gif" style="width: 600px;"/></kbd>

> [!NOTE]
> [Here](https://github.com/tonigineer/.dotfiles), you can find all of my [Hyprland](https://hyprland.org/) configuration.

## Dependencies

Not all dependencies are essential, but needed to get rid of all warnings within [Neovim](https://github.com/neovim) `checkhealth`:

```sh
sudo pacman -S cargo \
    fd \
    npm \
    python-neovim \
    ripgrep

sudo npm install -g neovim yarn tree-sitter
cargo install tree-sitter-cli
```

Make sure to have a [NerdFont](https://www.nerdfonts.com/font-downloads) installed:

```sh
wget -P ~/Downloads https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
unzip ~/Downloads/CascadiaCode.zip -d ~/.fonts

fc-cache -v
fc-list | grep Cas*  # check if it worked
```

## Installation

Simply clone this repository into your user config folder:

```sh
git clone https://github.com/tonigineer/nvim.git ~/.config/nvim
```

## Keybinds

<b>leader</b> is set to <kbd>Space</kbd>

Keys in <kbd>-- NORMAL --</kbd> | Action
---:|:---
<kbd>leader + q</kbd> | Close (`:q<CR>`)
<kbd>leader + ff</kbd> | [Telescope](home/.config/nvim/lua/keymaps/telescope.lua) find file
<kbd>leader + fb</kbd> | [Telescope](home/.config/nvim/lua/keymaps/telescope.lua) find buffer
<kbd>leader + fg</kbd> | [Telescope](home/.config/nvim/lua/keymaps/telescope.lua) grep string in files
<kbd>leader + hjkl</kbd> | Navigate splits
<kbd>leader + e</kbd> | Open [oil.nvim](https://github.com/stevearc/oil.nvim) in current directory
<kbd>more oil.nvim keyinds</kbd> | Check out [this config](./lua/plugins/config/oil.lua)

Keys in <kbd>-- INSERT --</kbd> | Action
---:|:---
<kbd>jk</kbd> or <kbd>kj</kbd> | Escape insert mode
