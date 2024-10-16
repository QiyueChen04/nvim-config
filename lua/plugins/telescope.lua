return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {
        noremap = true,
        silent = true,
      })

      vim.keymap.set(
        'n',
        '<leader>lg',
        builtin.live_grep,
        { noremap = true, silent = true }
      )

      vim.keymap.set(
        'n',
        '<leader>fdf',
        ':TelescopeDotfiles<CR>',
        { noremap = true, silent = true }
      )

      vim.api.nvim_create_user_command('TelescopeDotfiles', function()
        builtin.find_files({
          prompt_title = '< Dotfiles >',
          cwd = vim.fn.getcwd(), -- Uses the current directory
          hidden = true,
        })
      end, {})
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })
      require('telescope').load_extension('ui-select')
    end,
  },
}
