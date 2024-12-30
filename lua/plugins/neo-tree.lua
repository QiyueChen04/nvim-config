return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },


  config = function()
    vim.keymap.set(
      'n',
      '<leader>nt',
      ':Neotree filesystem reveal right<CR>',
      {}
    )
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Show hidden files (dotfiles)
          hide_gitignored = false, -- Optional: Show files ignored by .gitignore
          hide_hidden = false, -- Show all hidden files
        },
      },
    })
  end,
}
