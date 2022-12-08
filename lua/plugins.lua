local plugins = {
  -- Packer can manage itself as an optional plugin
  {"jsfaint/gen_tags.vim"},
  { "wbthomason/packer.nvim"},
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/plenary.nvim" },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    requires = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "rafamadriz/friendly-snippets",
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "hrsh7th/cmp-cmdline",
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
  },

  "ray-x/lsp_signature.nvim",
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate'
  },
  -- NvimTree
  {
    "luukvbaal/nnn.nvim",
  },
  -- Comments
  {
    "numToStr/Comment.nvim",
  -- event = "BufRead",
  },
  -- Status Line and Bufferline
  {
    "nvim-lualine/lualine.nvim",
  },
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
  },
  -- Formatter
  {
    "mhartington/formatter.nvim",
  },
  -- SchemaStore
  {
    "sainnhe/sonokai",
  --  event = 'VimEnter'
  },
}

-- starting
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    -- Log:warn "skipping loading plugins until Packer is installed"
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

-- packer.init(init_opts)
packer.startup(function(use)
  for _, plugin in ipairs(plugins) do
    use(plugin)
  end
  -- if packer_bootstrap then
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
