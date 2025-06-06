local languages = { 'javascript', 'typescript', 'html', 'tsx', 'python', 'css', 'c', 'cpp', 'java' }

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',

	config = function()
		local config = require('nvim-treesitter.configs')
		config.setup({
			auto_install = true,
			ensure_installed = languages,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.opt.foldmethod = 'expr'
		vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
		vim.opt.foldlevel = 99
	end,
}
