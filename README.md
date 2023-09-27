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
