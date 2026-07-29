vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  keymaps = {
    ['<leader>p'] = 'actions.preview',
    ['<leader>.'] = 'actions.toggle_hidden',
    ['q'] = 'actions.close',
  },

  float = {
    max_width = 0.7,
    max_height = 0.8,
  },
}

vim.keymap.set('n', '-', require('oil').open_float, { desc = 'Open Oil Fileviewer' })
