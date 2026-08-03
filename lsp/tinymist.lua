---@type vim.lsp.Config
return {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  settings = {
    preview = {
      browsing = { args = { '--open' } },
    },
  },
  on_attach = function(client)
    vim.api.nvim_create_user_command('Typst', function(args)
      local cmd = args.fargs[1]
      if cmd == 'preview' then client:exec_cmd { command = 'tinymist.startDefaultPreview', title = 'Preview' } end
    end, { nargs = 1, complete = function() return { 'preview' } end })
  end,
}
