return {
	{
		-- Treesitter
		-- IMPORTANT
		-- Much of the below taken from kickstart.nvim	
		-- Please see https://github.com/nvim-lua/kickstart.nvim
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = {
			ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc'},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				disable = {},
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { 'ruby' },
			},
			incremental_selection = { enable = true },
			textobjects = { enable = true},
			indent = { enable = true, disable = { 'ruby' }},
		},
		config = function(_, opts)

			-- Include languages here
			-- 'systemverilog' is sourced from
			-- lua\systemverilog.lua
			require'setup_systemverilog'.setupTreesitter(opts)

			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require('nvim-treesitter.install').prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require('nvim-treesitter.configs').setup(opts)
		end,
	}
}
