  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
local plugins = {
  -- Packer can manage itself as an optional plugin
  -- {"jsfaint/gen_tags.vim"},
  -- { "wbthomason/packer.nvim"},
  { "lewis6991/pckr.nvim" },
  { "neovim/nvim-lspconfig", start = true },
  { "nvim-lua/plenary.nvim", start = true },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    requires = { 'nvim-lua/plenary.nvim' },
    start = true
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    start = true,
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    start = true
  },
  {
    "rafamadriz/friendly-snippets",
    start = true
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
    start = true
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    start = true
  },
  {
    "saadparwaiz1/cmp_luasnip",
    start = true
  },
  {
    "hrsh7th/cmp-buffer",
    start = true
  },
  {
    "hrsh7th/cmp-path",
    start = true
  },
  {
    "hrsh7th/cmp-cmdline",
    start = true
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    start = true
  },

  {
    "ray-x/lsp_signature.nvim",
    start = true
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    start = true
  },
  -- NvimTree
  {
    "luukvbaal/nnn.nvim",
  },
  -- Comments
  {
    "numToStr/Comment.nvim",
    start = true,
  -- event = "BufRead",
  },
  -- Status Line and Bufferline
  {
    "nvim-lualine/lualine.nvim",
    start = true
  },
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    start = true
  },
  -- Formatter
  {
    "mhartington/formatter.nvim",
    start = true
  },
  -- SchemaStore
  {
    "sainnhe/sonokai",
    --  event = 'VimEnter'
    start = true
  },
  -- vimtex
  -- {
  --   "lervag/vimtex",
  --   opt = true,
  -- }
}


-- Automatically install packer
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/site/pack/pckr/opt/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()


 require('pckr').add(plugins)
