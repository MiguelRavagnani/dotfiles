require('lualine').setup {
  options = {
    component_separators = '|',
    section_separators = { left = '█', right = '█' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '█' }, right_padding = 0 },
    },
    lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'encoding', 'fileformat', 'filetype'},
    lualine_z = {
      { 'location', left_padding = 0 },
      { 'progress', left_padding = 0 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
