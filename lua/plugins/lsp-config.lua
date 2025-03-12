local ls = { 'lua_ls', 'ts_ls', 'tailwindcss', 'eslint', 'pyright', 'cssls' }

return {
  {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = ls,
      })
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set(
          'n',
          'gl',
          '<cmd>lua vim.diagnostic.open_float()<cr>',
          opts
        )
        vim.keymap.set('n', 'H', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      end)

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      for _, lsp in ipairs(ls) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      lspconfig.cssls.setup({
        capabilities = capabilities,
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      })
    end,
  },
}
