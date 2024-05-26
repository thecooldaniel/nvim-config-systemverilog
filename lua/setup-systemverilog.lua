local setup-systemverilog = {}

function setup-systemverilog.setupLsp()
    require('lspconfig').verible.setup({
      -- cmd = { 'verible-verilog-ls', '--rules_config_search' },
      cmd = { 'verible-verilog-ls' },
      root_dir = require('lspconfig').util.root_pattern({'.git', 'verilator.f'}),
      -- capabilities = capabilities,
      format_on_save = true,
    })
end

function setup-systemverilog.setupLinter(lint)
  
  lint.linters_by_ft = {
    systemverilog = { 'verilator' },
    verilog = { 'verilator' },
  }

  local verilator = lint.linters.verilator
  verilator.args = {
    "-sv",
    "-Wall",
    "--bbox-sys",
    "--bbox-unsup",
    "--lint-only",
    "-Irtl/include",
    '-f',
    vim.fs.find('verilator.f', {upward = true, stop = '/home'})[1],
    }


  lint.linters.verilator = verilator
  -- lint.linters["verilator"] = verilator

end

function setup-systemverilog.setupTreesitter(opts)
  table.insert(opts.ensure_installed, 'verilog')
  table.insert(opts.highlight.disable, {'verilog', 'systemverilog'})
end


return setup-systemverilog


