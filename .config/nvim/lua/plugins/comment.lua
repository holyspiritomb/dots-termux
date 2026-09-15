return {
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      require('Comment').setup {
        toggler = {
          ---Line-comment keymap
          line = '<A-c>',
          ---Block-comment keymap
          block = '<A-b>',
        },
        opleader = {
          line = '<A-c>',
          block = '<A-b>',
        },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
}
