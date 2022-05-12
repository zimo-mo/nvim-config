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
vim.api.nvim_set_keymap('n', 'fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fct', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ds', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ws', [[<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dws', [[<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ts', [[<cmd>lua require('telescope.builtin').treesitter()<CR>]], { noremap = true, silent = true})
