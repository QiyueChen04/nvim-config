return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },

  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        -- require('none-ls-extras.diagnostics.eslint_d'),

        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            '--config-path',
            '/Users/jackchen/.config/nvim/stylua.toml',
          },
        }),

        null_ls.builtins.formatting.prettierd.with({
          prefer_local = 'node_modules/.bin', -- Use local prettier
        }),

        null_ls.builtins.formatting.black.with({
		  command = '/Users/jackchen/.local/share/nvim/mason/bin/black'
		}),
      },
    })

    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {})
  end,
}
