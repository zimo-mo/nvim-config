require('formatter').setup({
  filetype = {
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    cpp = {
      -- clang-format
      function()
         return {
           exe = "clang-format",
           args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
           stdin = true,
           cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
         }
      end
    },
    go = {
      function()
        return {
          exe = "gofmt",
          args = { "-w" },
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = "python3 -m autopep8",
          args = {
            "--in-place --aggressive --aggressive",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
          },
          stdin = false
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote"},
          stdin = true
        }
      end
    },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.json,*.rs,*.lua FormatWrite
augroup END
]], true)

vim.cmd([[
nnoremap <silent> <leader>f :Format<CR>
]])
