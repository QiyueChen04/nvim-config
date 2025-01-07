return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  ft = { 'markdown' },
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
	vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_theme = 'dark'



    vim.cmd([[
	  function OpenMarkdownPreview (url)
            let cmd = "open -na 'Google Chrome' --args --new-window " . shellescape(a:url) . " &"
            silent call system(cmd)
	  endfunction
    ]])
    vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    --   vim.cmd([[
    -- function OpenMarkdownPreview (url)
    --   execute "silent ! open -a Google\ Chrome -n --args --new-window " . a:url
    -- endfunction
    --     ]])
    --   vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
  end,
  config = function() end,
}
