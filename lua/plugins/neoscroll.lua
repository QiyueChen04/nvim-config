return {
  'karb94/neoscroll.nvim',
  opts = {},
  config = function()
    require('neoscroll').setup({
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      duration_multiplier = 1.0, -- Global duration multiplier
      easing = 'linear', -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
      ignored_events = { -- Events ignored while scrolling
        'WinScrolled',
        'CursorMoved',
      },
    })
    -- Define custom key mappings for Neoscroll
    local keymap = {
      ['<C-u>'] = function() require('neoscroll').ctrl_u({ duration = 250 }) end,
      ['<C-d>'] = function() require('neoscroll').ctrl_d({ duration = 250 }) end,
      ['<C-h>'] = function() require('neoscroll').ctrl_b({ duration = 450 }) end,
      ['<C-l>'] = function() require('neoscroll').ctrl_f({ duration = 450 }) end,
      ['<C-k>'] = function()
        require('neoscroll').scroll(
          -1,
          { move_cursor = false, duration = 1}
        )
      end,
      ['<C-j>'] = function()
        require('neoscroll').scroll(
          1,
          { move_cursor = false, duration = 1 }
        )
      end,
      ['zt'] = function() require('neoscroll').zt({ half_win_duration = 250 }) end,
      ['zz'] = function() require('neoscroll').zz({ half_win_duration = 250 }) end,
      ['zb'] = function() require('neoscroll').zb({ half_win_duration = 250 }) end,
    }

    -- Set key mappings for normal, visual, and select modes
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
