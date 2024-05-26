--  _  ___   _____ __  __                                                              
-- | \| \ \ / /_ _|  \/  |                                                             
-- | .` |\ V / | || |\/| |                                                             
-- |_|\_| \_/ |___|_|  |_|                                                             
--  _____   _____ _____ ___ __  ____   _____ ___ ___ _    ___   ___                    
-- / __\ \ / / __|_   _| __|  \/  \ \ / / __| _ \_ _| |  / _ \ / __|                   
-- \__ \\ V /\__ \ | | | _|| |\/| |\ V /| _||   /| || |_| (_) | (_ |                   
-- |___/ |_| |___/ |_| |___|_|  |_| \_/ |___|_|_\___|____\___/ \___|                   
--  ___  _____   __                                                                    
-- |   \| __\ \ / /                                                                    
-- | |) | _| \ V /                                                                     
-- |___/|___| \_/                                                                                                                                           

-- CHANGE ME
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true

-- Recommended diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Use lazy.nvim for to manage plugins
-- https://github.com/folke/lazy.nvim

-- If a different plugin manager is desired,
-- you may need to tweak how some plugins are installed
-- and their configurations defined

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Specify and configure plugins
local plugins = {
	-- lua\nvim-lspconfig.lua
	require'nvim-lspconfig',
	-- lua\nvim-treesitter.lua
	require'nvim-treesitter',
}

-- Setup lazy.nvim
require("lazy").setup(plugins)



