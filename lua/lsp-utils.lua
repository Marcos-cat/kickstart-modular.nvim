return {
  ---@param client vim.lsp.Client
  ---@param settings_name string
  ---@param settings table
  change_settings = function(client, settings_name, settings)
    ---@type unknown
    local old_settings = client.settings[settings_name]
    local new_settings = vim.tbl_deep_extend('force', old_settings, settings)
    client.settings[settings_name] = new_settings
    client:notify('workspace/didChangeConfiguration', { settings = true })
  end,
}
