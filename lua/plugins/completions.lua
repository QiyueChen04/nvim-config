local ls = { 'lua_ls', 'ts_ls', 'tailwindcss', 'eslint', 'pyright' }
return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip', -- VSnip source for nvim-cmp
      'hrsh7th/vim-vsnip', -- VSnip snippet engine
    },

    config = function()
      local cmp = require('cmp')
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback() -- Insert tab character if completion menu is not visible
            end
          end, { 'i', 's' }),

          -- Shift+Tab to select the previous item
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- Confirm selection with Enter (similar to VS Code)
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          -- Abort completion with Escape or Ctrl+e (similar to VS Code)
          ['<C-e>'] = cmp.mapping.abort(),
          ['<Esc>'] = cmp.mapping.abort(),
        }, {
          completion = {
            autocomplete = { cmp.TriggerEvent.TextChanged },
          },
        }),
        sources = cmp.config.sources({
          { name = 'vsnip' }, -- VSnip for snippets
          { name = 'nvim_lsp' }, -- LSP source
          { name = 'buffer' }, -- Buffer source
          { name = 'path' }, -- path source
        }),
      })

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	

	  local lspconfig = require('lspconfig');
	  for _, lsp in ipairs(ls) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end


      require('lspconfig')['ts_ls'].setup({
        capabilities = capabilities,
      })
      require('lspconfig')['lua_ls'].setup({
        capabilities = capabilities,
      })
      require('lspconfig')['tailwindcss'].setup({
        capabilities = capabilities,
      })
    end,
  },
}
