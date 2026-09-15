return {
  { 
    "https://codeberg.org/jthvai/lavender.nvim",
    priority = 1000,
    config = function()
      -- Default config in lua
      vim.cmd([[highlight default link @string.lua Question]])
      vim.cmd([[highlight default link xmlString Question]])
      vim.cmd([[highlight default link @string Question]])
      vim.cmd([[highlight default link @string.json Question]])
      vim.cmd([[highlight default link @string.python Question]])
      vim.cmd([[highlight default link @string.documentation.python Question]])
      vim.cmd([[highlight default link @string.jsonc Question]])
      vim.cmd([[highlight default link @string.typescript Question]])
      vim.cmd([[highlight default link @string.javascript Question]])
      vim.g.lavender = {
        transparent = {
          background = false, -- do not render the main background
          float      = false, -- do not render the background in floating windows
          popup      = false, -- do not render the background in popup menus
          sidebar    = false, -- do not render the background in sidebars
        },
        contrast = true, -- colour the sidebar and floating windows differently to the main background

        italic = {
          comments  = false, -- italic comments
          functions = false, -- italic function names
          keywords  = false, -- italic keywords
          variables = false, -- italic variables
        },

        signs = true, -- use icon (patched font) diagnostic sign text

        -- new values will be merged in
        overrides = {
          -- highlight groups - see theme.lua
          -- existing groups will be entirely replaced
          theme = {},

          colors = {
            cterm = {}, -- cterm colours - see colors/cterm.lua
            hex = {}, -- hex (true) colours - see colors/hex.lua
          },
        },
      }
    end,
  },
}
