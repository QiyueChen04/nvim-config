return {
  {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'ts_ls',
          'tailwindcss',
          'eslint',
        },
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

      local servers = { 'lua_ls', 'ts_ls', 'tailwindcss', 'eslint' }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      -- on_attach = function(client, bufnr)
      -- 	-- Set up keybinding for hover and error diagnostics in a floating window
      -- 	vim.api.nvim_buf_set_keymap(
      -- 		bufnr,
      -- 		'n',
      -- 		'K',
      -- 		'<Cmd>lua vim.diagnostic.open_float()<CR>',
      -- 		{ noremap = true, silent = true }
      -- 	)
      -- end
      --
      -- vim.keymap.set('n', 'H', vim.lsp.buf.hover, {})
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
