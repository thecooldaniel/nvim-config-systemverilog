# nvim-config-systemverilog

## Background
When trying to set up common Neovim plugins for use with SystemVerilog, I discovered that there were very few examples of working configurations. in addition, many of the configuration examples provided by maintainers of plugins for SystemVerilog were often lacking documentation. Therefore, I wanted to share a small configuration based on my own to close the loop for future users like me.  

## Purpose
To provide a minimum viable config as a point of reference for configuring an LSP, linter, and Treesitter plugin for use with SystemVerilog. It is *not* meant to replace your own configuration; only a point of reference.  

## File List
`example` - Contains an example SystemVerilog project to test the config

`lua` - Contains the plugin specs and configurations for SystemVerilog. These files are called from within `init.lua`

`init.lua` - The entry point for all Neovim configuration

`lazy-lock.json` - Locks the various plugins at known-good versions that work together.

## Included Plugins
`lazy.nvim` - Plugin installation, configuration, and management

`nvim-lspconfig` - Configurations for the built-in LSP functionality

`nvim-lint` - provides linting for various filetypes

`nvim-treesitter` - Provides Treesitter interation for various filetypes

## SystemVerilog
This configuration targets `verilator` for linting, and `verible-verilog-ls` as the language server. Other providers can be used, but are outside the scope of this project. You will need to make sure to have both `verilator` and `verible-verilog-ls` on your path. https://verilator.org/guide/latest/install.html 

 ## Getting Started
1. Clone the repo, making sure *to not* over write your Neovim config, for example: `git clone git@github.com:thecooldaniel/nvim-config-systemverilog.git ~/.config/nvim-systemverilog`
2. Launch Neovim, specifying the new config: `NVIM_APPNAME=nvim-systemverilog nvim`
3. `lazy.nvim` should be installed, an in turn it should install all the other plugins
4. Run `:Lazy` to verify. Press `q` to close the window.
5. **IMPORTANT:** Set the CWD of the editor/tab to the root of a SystemVerilog project. The root is defined as the directory from which `verilator` should be run
6. Open `example\sim\tb_counter.sv`, `example\rtl\counter.sv`, or `example\rtl\include\packageExample.svh`. Each of these files should contain warnings and/or errors.
![Image showing errors on the files mentioned in step 6](screenshot.png)

## Notes
- `verilator` needs to be given include directories explicitly when it is called; this is done similiar to GCC with syntax such as `-Irtl`. In this project, the include flags are present in `example\verilator.f`. For details, see `lua\setup_systemverilog.lua`.
- If you do not set the CWD of the editor/tab, linting *will not work*.
- Syntax highlighting provided via `nvim-tressitter` can be hit or miss. See `lua\setup_systemverilog.lua` on how to disable it.
- While the linter is configured to fire on several Neovim events, it only reliably fires on file save.

## Troubleshooting
### Verify plugin config
- `:LspConfig` should show `verible` attached to at least one open `*.sv/*.svh` buffer
- `:InspectTree` should spawn a window with the tree structure generated by Treesitter. You might get Lua errors on first run.
- `:lua =require(`lint`).linters.verilator` will show you all of the arguments passed to `verilator` when linting. The last argument should be a path; if the argument list ends with `-f` then `vim.fs.find` cannot locate `verilator.f`

### Linting not working, or missing files?
- Ensure you have set the CWD. See above.
- Ensure you have either set include flags in the argument sent to `verilator` in `lua\setup_systemverilog.lua`, or in `verilator.f`. 
- If the include flags are present, make sure they are either absolute, or relative to the current CWD.

### Errors/warnings are stale
- Save the buffer with `:w`

### Errors/warnings reference objects not present in buffer
- This is most likely caused by an error/warning present in an imported package.

## Other Recommened Plugins
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim) (Not used in this project because it only supports the `verible-verilog-xxxx` binaries for all functionality, including linting.)
