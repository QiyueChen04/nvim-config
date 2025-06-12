vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set autoindent')
vim.cmd('set mouse=a')
vim.cmd('set clipboard=unnamed')
-- vim.keymap.set("v", "y", '"0y')  -- Yank to register 0
-- vim.keymap.set("v", "p", '"0p')  -- Paste from register 0
vim.cmd('set cindent')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--vim.cmd("syntax on")
--vim.cmd("colorscheme evening")
--vim.cmd("set background=dark")

vim.cmd('set timeoutlen=500')
vim.cmd('inoremap kj <Esc>')
