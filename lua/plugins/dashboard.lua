return {
  'nvimdev/dashboard-nvim',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      shortcut_type = 'number',

      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = '󰊳 Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'TelescopeDotfiles',
            key = 'd',
          },
        },
      },
    })
  end,
}
