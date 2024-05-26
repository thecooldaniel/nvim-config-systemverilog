return {
    {
        'mfussenegger/nvim-lint',
        -- While all of these events are set, only a few
        -- seem to actually trigger the linting process currently.
        -- This seems to be a bug/missing feature in nvim-lint itself.

        -- Long story short: you will most likely need to save to re-lint the file
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
                        -- try_lint() will run every linter configured with linters_by_ft().
                        -- See lua\setup_systemverilog.lua
                        lint.try_lint()
                    end, 1)
                end,
            })
        end,
    },
}
