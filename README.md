# Neovim config 

## Requirements

 - Install neovim >= 0.7
 - Install clangd for c/c++ complete
 - Install rust-analyzer for rust complete
 - Install jedi_language_server for python complete
 
## The Structure of Configuration

 ```bash
├── init.lua
├── lua
│   ├── base.lua
│   ├── pluginrc
│   │   ├── comment.lua
│   │   ├── formatter.lua
│   │   ├── gen_tags.lua
│   │   ├── indent-blankline.lua
│   │   ├── lsp.lua
│   │   ├── luasnip.lua
│   │   ├── nvim-autopairs.lua
│   │   ├── nvim-toggleterm.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── statusline.lua
│   │   ├── telescope.lua
│   │   └── theme.lua
│   └── plugins.lua
 ```

## Installation

```bash
git clone https://github.com/zimo-geek/nvim-config.git $HOME/.config/nvim
```

## Other

vim 8.0+ see: [viplugins](https://github.com/zimo-geek/viplugins)
