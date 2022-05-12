-- encoding
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

--Set highlight on search
vim.o.hlsearch = false
--Enable mouse mode
vim.o.mouse = 'a'
--Enable break indent
vim.o.breakindent = true
--Case insensitive searching UNLESS /C or capital in search vim.o.ignorecase = true vim.o.smartcase = true Decrease update time
vim.o.updatetime = 250

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

--Make line numbers default
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.wo.foldmethod = 'syntax'
vim.wo.foldexpr = "99"
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "80"

--Save undo history
vim.opt.undofile = true

vim.o.swapfile = false
vim.o.undofile = false

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.cmd('filetype indent plugin on')
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 4        -- shift 4 spaces when tab
vim.opt.tabstop = 4           -- 1 tab == 4 spaces
vim.opt.smartindent = true    -- autoindent new lines
vim.opt.autoindent = true

-- Enabling ruler and statusline.
vim.opt.ruler = true

-- Switch on syntax highlighting.
vim.opt.syntax = "on"
vim.g.asmsyntax = "asm"

-- remove line lenght marker for selected filetypes
vim.cmd([[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]])

-- 2 spaces for selected filetypes
vim.cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

vim.cmd([[
:cabbrev E Explore
]])

