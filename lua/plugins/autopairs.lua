return {
  'windwp/nvim-autopairs',
  config = function()
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    require('nvim-autopairs.rule')

    npairs.setup({
      check_ts = true,
      map_cr = true,
    })

    npairs.add_rule(
      Rule("<", ">")
        :with_pair(function(opts)
          local filetype = vim.bo.filetype
          return filetype == "html" or filetype == "jsx" or filetype == "javascript" or filetype == "typescript"
        end)
        :with_move(function(opts)
          return opts.char == ">"
        end)
        :with_del(function(opts)
          return opts.prev_char:match("<.*")
        end)
    )
  end,
}
