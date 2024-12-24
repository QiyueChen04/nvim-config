return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      -- Predefined mappings (useful if you want to comment/uncomment easily)
      toggler = {
        line = '<leader>c', -- Toggle comment for the current line
        block = '<leader>C', -- Toggle comment for the selected block
      },
      opleader = {
        line = '<leader>c', -- Comment with visual mode (line)
        block = '<leader>C', -- Comment with visual mode (block)
      },
    })
  end,
}
