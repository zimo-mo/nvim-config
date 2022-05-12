-- configure lspconfig, nvim-cmp, luasnip
local nvim_lsp = require('lspconfig')

-- luasnip load
require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- select item then close quickfix window
  vim.cmd([[autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>]])

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd', 'rust_analyzer', 'jedi_language_server', 'bashls', 'cmake', 'sumneko_lua'}
-- local servers = { 'clangd', 'pyright', 'bashls', 'cmake', 'sumneko_lua'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    autostart = true,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- local opts = {
--     tools = { -- rust-tools options
--         -- Automatically set inlay hints (type hints)
--         autoSetHints = true,
-- 
--         -- Whether to show hover actions inside the hover window
--         -- This overrides the default hover handler 
--         hover_with_actions = true,
-- 
--         -- how to execute terminal commands
--         -- options right now: termopen / quickfix
--         -- executor = require("rust-tools/executors").termopen,
-- 
--         -- callback to execute once rust-analyzer is done initializing the workspace
--         -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
--         on_initialized = nil,
-- 
--         runnables = {
--             -- whether to use telescope for selection menu or not
--             use_telescope = true
-- 
--             -- rest of the opts are forwarded to telescope
--         },
-- 
--         debuggables = {
--             -- whether to use telescope for selection menu or not
--             use_telescope = true
-- 
--             -- rest of the opts are forwarded to telescope
--         },
-- 
--         -- These apply to the default RustSetInlayHints command
--         inlay_hints = {
-- 
--             -- Only show inlay hints for the current line
--             only_current_line = false,
-- 
--             -- Event which triggers a refersh of the inlay hints.
--             -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
--             -- not that this may cause  higher CPU usage.
--             -- This option is only respected when only_current_line and
--             -- autoSetHints both are true.
--             only_current_line_autocmd = "CursorHold",
-- 
--             -- wheter to show parameter hints with the inlay hints or not
--             show_parameter_hints = true,
-- 
--             -- whether to show variable name before type hints with the inlay hints or not
--             show_variable_name = false,
-- 
--             -- prefix for parameter hints
--             parameter_hints_prefix = "<- ",
-- 
--             -- prefix for all the other hints (type, chaining)
--             other_hints_prefix = "=> ",
-- 
--             -- whether to align to the length of the longest line in the file
--             max_len_align = false,
-- 
--             -- padding from the left if max_len_align is true
--             max_len_align_padding = 1,
-- 
--             -- whether to align to the extreme right or not
--             right_align = false,
-- 
--             -- padding from the right if right_align is true
--             right_align_padding = 7,
-- 
--             -- The color of the hints
--             highlight = "Comment",
--         },
-- 
--         hover_actions = {
--             -- the border that is used for the hover window
--             -- see vim.api.nvim_open_win()
--             border = {
--                 {"╭", "FloatBorder"}, {"─", "FloatBorder"},
--                 {"╮", "FloatBorder"}, {"│", "FloatBorder"},
--                 {"╯", "FloatBorder"}, {"─", "FloatBorder"},
--                 {"╰", "FloatBorder"}, {"│", "FloatBorder"}
--             },
-- 
--             -- whether the hover action window gets automatically focused
--             auto_focus = false
--         },
-- 
--         -- settings for showing the crate graph based on graphviz and the dot
--         -- command
--         crate_graph = {
--             -- Backend used for displaying the graph
--             -- see: https://graphviz.org/docs/outputs/
--             -- default: x11
--             backend = "x11",
--             -- where to store the output, nil for no output stored (relative
--             -- path from pwd)
--             -- default: nil
--             output = nil,
--             -- command to pipe the output to, nil for no piping
--             pipe = nil,
--             -- NOTE: Be careful when using pipe and output together
--             -- true for all crates.io and external crates, false only the local
--             -- crates
--             -- default: true
--             full = true,
--         }
--     },
-- 
--     -- all the opts to send to nvim-lspconfig
--     -- these override the defaults set by rust-tools.nvim
--     -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
--     server = {
--         -- standalone file support
--         -- setting it to false may improve startup time
--         standalone = true,
--     }, -- rust-analyer options
-- 
--     -- debugging stuff
--     -- dap = {
--     --     adapter = {
--     --         type = 'executable',
--     --         command = 'lldb-vscode',
--     --         name = "rt_lldb"
--     --     }
--     -- }
-- }
-- 
-- require('rust-tools').setup(opts)

-- lua lsp
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
        },
    },
}


-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip', options = { use_show_condition = true } },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'cmdline' },
    { name = 'omni' }
  },
  completion = {
      ---@usage The minimum length of a word to complete on.
      keyword_length = 1,
    },
}

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

nvim_lsp['texlab'].setup {
  on_attach = on_attach,
  autostart = true,
  flags = {
    debounce_text_changes = 150,
  },
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = false
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {}
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      }
    }
  },
  single_file_support = true
}

