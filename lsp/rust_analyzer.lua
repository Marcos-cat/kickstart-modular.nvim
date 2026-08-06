local utils = require 'lsp-utils'

---@type vim.lsp.Config
return {
  cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      check = { command = 'check' },
      cargo = { features = 'all' },
      rustfmt = { extraArgs = { '+nightly' } },
    },
  },
  on_attach = function(client)
    vim.api.nvim_create_user_command('RustCheck', function(args)
      local cmd = string.match(args.fargs[1], '%a+')
      utils.change_settings(client, 'rust-analyzer', { check = { command = cmd } })
    end, { nargs = 1, complete = function() return { 'check', 'clippy' } end })
  end,
}
