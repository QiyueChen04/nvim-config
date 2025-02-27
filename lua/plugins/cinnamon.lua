-- for smooth scrolling
return {
  "declancm/cinnamon.nvim",
  version = "*", -- use latest release
  opts = {
    -- change default options here
    -- Enable all provided keymaps
    keymaps = {
      basic = true,
      extra = true,
    },
    -- Custom scroll options
    options = {
      mode = "cursor",  -- Animate cursor and window scrolling for any movement
      delay = 3,        -- Delay between each movement step (in ms)
      step_size = {
        vertical = 1,   -- Number of cursor/window lines moved per step
        horizontal = 1, -- Number of cursor/window columns moved per step
      },
      max_delta = {
        line = false,   -- Maximum distance for line movements before scroll animation is skipped
        column = false, -- Maximum distance for column movements before scroll animation is skipped
        time = 1000,    -- Maximum duration for a movement (in ms)
      },
      -- Optional post-movement callback
      callback = function()
        -- print("Scrolling done!")
      end,
    },
  },
}
