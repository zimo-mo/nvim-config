-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      case_mode = "ignore_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  --- ctags_outline = {
  ---           --ctags option
  ---           ctags = {'ctags'},
  ---           --ctags filetype option
  ---           set_ft_opt = function(ft_opt)
  ---               ft_opt.vim = '--vim-kinds=fk'
  ---               ft_opt.lua = '--lua-kinds=fk'
  ---               ft_opt.c = "--c-kinds=fp"
  ---               ft_opt.cpp = "--c++-kinds=fp --language-force=C++"
  ---               ft_opt.python = "--python-kinds=fm --language-force=Python"
  ---           end
  ---       }
}


require('telescope').load_extension('fzf')
-- require('telescope').extensions.ctags_outline.outline()
-- require('telescope').load_extension('ctags_outline')

--Add leader shortcuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ft', builtin.tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fp', builtin.grep_string, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>dws', builtin.lsp_dynamic_workspace_symbols, { noremap = true, silent = true})
vim.keymap.set('n', '<leader>ts', builtin.treesitter, { noremap = true, silent = true})
