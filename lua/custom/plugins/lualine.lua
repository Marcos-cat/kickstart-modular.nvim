vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
  callback = function() require('lualine').refresh { trigger = 'autocmd' } end,
  group = vim.api.nvim_create_augroup('MacroDisplay', { clear = true }),
})

local LUALINE_PATH = {
  NAME = 0,
  RELATIVE = 1,
  ABSOLUTE = 2,
}

local function macro_display()
  local reg = vim.fn.reg_recording()
  if reg == '' then return '' end
  return '@' .. reg
end

local function lsps_display()
  local lsps = {}
  for _, lsp in ipairs(vim.lsp.get_clients()) do
    if lsp.attached_buffers[vim.api.nvim_get_current_buf()] then lsps[#lsps + 1] = lsp.name end
  end

  if #lsps == 0 then return '' end

  return table.concat(lsps, ' '):gsub('language_server', 'ls')
end

local function word_count()
  local pos1, pos2 = vim.fn.getpos '.', vim.fn.getpos 'v'
  local text
  if vim.api.nvim_get_mode().mode == 'V' then
    local line1, line2 = pos1[2], pos2[2]
    line1, line2 = math.min(line1, line2), math.max(line1, line2)
    text = table.concat(vim.api.nvim_buf_get_lines(0, line1 - 1, line2, false), '\n')
  else
    text = table.concat(vim.fn.getregion(pos1, pos2), '\n')
  end
  local _, words = text:gsub("[%a%']+", '')
  return words
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', icon = '' },
      { macro_display },
      {
        word_count,
        cond = function()
          return vim.tbl_contains({ 'markdown', 'text', 'typst' }, vim.bo.filetype) and vim.tbl_contains({ 'V', 'v', 'X' }, vim.api.nvim_get_mode().mode)
        end,
      },
    },
    lualine_b = { { 'branch', icon = '' }, 'diff' },
    lualine_c = { 'diagnostics' },

    lualine_x = { { 'filename', path = LUALINE_PATH.RELATIVE } },
    lualine_y = { 'filetype', { lsps_display } },
    lualine_z = { 'progress' },
  },
}
