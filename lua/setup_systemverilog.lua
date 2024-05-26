local setup_systemverilog = {}

function setup_systemverilog.setupLsp()
	require('lspconfig').verible.setup({
		-- cmd = { 'verible-verilog-ls', '--rules_config_search' },
		cmd = { 'verible-verilog-ls' },
		root_dir = require('lspconfig').util.root_pattern({'.git', 'verilator.f'}),
		-- capabilities = capabilities,
		format_on_save = true,
	})
end

function setup_systemverilog.setupLinter(lint)

	lint.linters_by_ft = {
		systemverilog = { 'verilator' },
		verilog = { 'verilator' },
	}

	local verilator = lint.linters.verilator

	-- Add/change arguments for Verilator here.
	-- You can also use or re-use a verilator.f file (see example\verilator.f)
	-- placed anywhere between CWD and your home dir and it
	-- will be read by Verilator
	
	-- The arguments below are the default provided by nvim-lint
	-- https://github.com/mfussenegger/nvim-lint/blob/master/lua/lint/linters/verilator.lua
	verilator.args = {
		"-sv",
		"-Wall",
		"--bbox-sys",
		"--bbox-unsup",
		"--lint-only",
		'-f',
		vim.fs.find('verilator.f', {upward = true, stop = vim.env.HOME})[1],
	}


	lint.linters.verilator = verilator
end

function setup_systemverilog.setupTreesitter(opts)
	table.insert(opts.ensure_installed, 'verilog')

	-- Uncomment below to disable highlighting via Treesitter
	--table.insert(opts.highlight.disable, {'verilog', 'systemverilog'})
end


return setup_systemverilog


