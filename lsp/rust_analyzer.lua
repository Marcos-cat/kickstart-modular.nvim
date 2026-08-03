---@param client vim.lsp.Client
---@param settings_name string
---@param settings table
local function change_settings(client, settings_name, settings)
  ---@type unknown
  local old_settings = client.settings[settings_name]
  local new_settings = vim.tbl_deep_extend('force', old_settings, settings)
  client:notify('workspace/didChangeConfiguration', { settings = new_settings })
end

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
      local cmd = args.fargs[1]
      change_settings(client, 'rust-analyzer', { check = { command = cmd } })
    end, { nargs = 1, complete = function() return { 'check', 'clippy' } end })
  end,
}
