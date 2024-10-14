return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
	  autostart = true,
      options = {
        theme = 'dracula',
      },
    })
  end,
}
