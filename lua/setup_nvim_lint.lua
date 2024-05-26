return {
	{
		'mfussenegger/nvim-lint',
		event = {
			'BufReadPre',
			'BufNewFile',
			'BufWritePost',
			'TextChanged', 
			'InsertLeave'
		},
		config = function()
			local lint = require 'lint'

			-- Include languages here
			require('setup_systemverilog').setupLinter(lint)

			vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'TextChanged', 'InsertLeave' }, {
				group = vim.api.nvim_create_augroup('nvim_lint', { clear = true }),
				callback = function()
					vim.defer_fn(function()
						lint.try_lint()
					end, 1)
				end,
			})
		end,
	},
}
