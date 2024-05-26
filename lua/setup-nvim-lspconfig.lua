
return {
	'neovim/nvim-lspconfig',
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
			callback = function(event)
				-- IMPORTANT
				-- Much of the below taken from kickstart.nvim	
				-- Please see https://github.com/nvim-lua/kickstart.nvim
				local map = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				end

				-- Some keymaps
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				map('K', vim.lsp.buf.hover, 'Hover Documentation')
				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
					vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd('LspDetach', {
						group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
						end,
					})
				end

				-- The following autocommand is used to enable inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map('<leader>th', function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, '[T]oggle Inlay [H]ints')
				end
			end,
		})

		-- Include languages here
		-- 'systemverilog' is sourced from
		-- lua\systemverilog.lua
		require'setup-systemverilog'.setupLsp()

	end,
}
