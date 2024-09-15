# vim-nickhernd
# My Neovim Configuration

This repository contains my personal Neovim configuration, optimized for efficient coding and text editing. It includes a variety of plugins and custom keybindings to enhance the Neovim experience.

## Features

- Plugin management with [Packer.nvim](https://github.com/wbthomason/packer.nvim)
- Beautiful and functional UI with [Tokyo Night](https://github.com/folke/tokyonight.nvim) color scheme
- Efficient code navigation with [EasyMotion](https://github.com/easymotion/vim-easymotion)
- Powerful fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Syntax highlighting and code parsing with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Intelligent code completion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- File explorer with [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- And much more!

## Installation

1. Ensure you have Neovim 0.5+ installed.
2. Clone this repository:
   ```
   git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim
   ```
3. Install [Packer.nvim](https://github.com/wbthomason/packer.nvim) if you haven't already.
4. Open Neovim and run `:PackerInstall` to install all plugins.

## Key Mappings

Here are some of the custom key mappings included in this configuration:

- `<Space>` is used as the leader key
- `<Space>;` : Enter command mode
- `<Space>w` : Save file
- `<Space>q` : Quit
- `<Space>e` : Toggle file explorer
- `<Alt-h/j/k/l>` : Navigate between windows
- `<Alt-Up/Down/Left/Right>` : Resize windows
- `<Space>s` : EasyMotion search (2 chars)
- `<Space>j/k` : EasyMotion line motions
- `<Space>ff` : Telescope find files
- `<Space>fg` : Telescope live grep

For a full list of mappings, please refer to the `init.lua` file.

## Customization

Feel free to fork this repository and modify the configuration to suit your needs. The main configuration file is `init.lua`, and plugin-specific configurations can be found in the `lua/plugins.lua` file.

## Contributing

If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This project is open source and available under the [MIT License](LICENSE).
