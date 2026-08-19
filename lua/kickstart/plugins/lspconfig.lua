-- [[ LSP Configuration ]]

-- Useful status updates for LSP.
vim.pack.add { 'https://github.com/j-hui/fidget.nvim' }
require('fidget').setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('K', vim.lsp.buf.hover, 'Hover')

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('grh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, 'Toggle Inlay [H]ints')
    end
  end,
})

vim.pack.add { 'https://github.com/mason-org/mason.nvim' }
require('mason').setup {}

local mason_tools = { 'lua-language-server', 'tinymist', 'panache' }

local uninstalled = vim.tbl_filter(function(tool) return not require('mason-registry').is_installed(tool) end, mason_tools)
if #uninstalled > 0 then vim.cmd('MasonInstall ' .. table.concat(uninstalled, ' ')) end

for lsp in vim.fs.dir(vim.fs.joinpath(vim.fn.stdpath 'config', 'lsp')) do
  vim.lsp.enable(string.match(lsp, '^(.+)%.lua$'))
end

-- vim: ts=2 sts=2 sw=2 et
