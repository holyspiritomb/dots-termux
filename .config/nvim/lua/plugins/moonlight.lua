return {
  {
    -- 'shaunsingh/moonlight.nvim',
    'blandcr/moonlight.nvim',
    config = function()
      vim.g.moonlight_italic_functions = 0
      vim.g.moonlight_italic_keywords = 0
      vim.g.moonlight_italic_strings = 1
      vim.g.moonlight_italic_variables = 0
    end,
  },
}
