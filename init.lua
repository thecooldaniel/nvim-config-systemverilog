                                                                              
-- _  ___   _____ __  __                                                              
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
	{'neovim/nvim-lspconfig'},
}

-- Setup lazy.nvim
require("lazy").setup(plugins)



