vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  custom_highlights = function(color)
    return {
      ColorColumn = { bg = color.surface0 },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin-nvim'
