return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    init = function()
      vim.keymap.set('n', '<leader>cl', "<Cmd>:CocList<cr>")
      vim.keymap.set('n', '<leader>cc', "<Cmd>:CocConfig<cr>")
      vim.keymap.set('n', '<leader>ch', "<Cmd>:checkhealth coc<cr>")
      vim.keymap.set('n', '<leader>ci', "<Cmd>:CocInfo<cr>")
    end
  },
}
