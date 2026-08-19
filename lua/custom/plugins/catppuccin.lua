vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  custom_highlights = function(color)
    return {
      ColorColumn = { bg = color.surface0 },
      FloatTitle = { fg = color.text },

      ['@markup.italic'] = { fg = color.blue },

      -- Set up highlights to match https://uiua.org/pad
      UiuaNoadicFunction = { fg = color.red },
      UiuaMonadicFunction = { fg = color.green },
      UiuaDyadicFunction = { fg = color.blue },
      UiuaTriadicFunction = { fg = color.lavender },
      UiuaTetradicFunction = { fg = color.green },
      UiuaMonadicModifier = { fg = color.yellow },
      UiuaDyadicModifier = { fg = color.mauve },
      UiuaTriadicModifier = { fg = color.green },
      UiuaString = { fg = color.sapphire },
      UiuaModule = { fg = color.flamingo },
      UiuaFileIcon = { fg = color.sky },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin-nvim'
