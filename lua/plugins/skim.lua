-- Lazy plugin config for vimtex
return {
  'lervag/vimtex',
  lazy = false, -- Load immediately
  init = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_method = 'latexmk'
  end,
}

