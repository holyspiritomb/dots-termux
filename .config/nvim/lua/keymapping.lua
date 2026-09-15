vim.keymap.set({'n','i'}, '<c-q>', "<Cmd>:q<cr>")
vim.keymap.set({'n','i'}, '<c-w>', "<Cmd>:w<cr>")
vim.keymap.set('n', '<c-x>', ":q!<cr>")
vim.keymap.set('n', '<A-j>', "<Cmd>:wincmd j<cr>")
vim.keymap.set('n', '<A-Down>', "<Cmd>:wincmd j<cr>")
vim.keymap.set('n', '<A-k>', "<Cmd>:wincmd k<cr>")
vim.keymap.set('n', '<A-Up>', "<Cmd>:wincmd k<cr>")
vim.keymap.set('n', '<A-l>', "<Cmd>:wincmd l<cr>")
vim.keymap.set('n', '<A-Right>', "<Cmd>:wincmd l<cr>")
vim.keymap.set('n', '<A-Left>', "<Cmd>:wincmd h<cr>")
vim.keymap.set({'n','i'}, '<A-u>', "<Cmd>:undo<cr>")
vim.keymap.set({'n','i'}, '<A-r>', "<Cmd>:redo<cr>")
vim.keymap.set('n', '<c-s>', ":split<cr>")
vim.keymap.set('n', '<c-s>', ":split<cr>")
vim.keymap.set('n', '<leader>i', ":Inspect<cr>")
vim.keymap.set('n', 'bn', ":bNext<cr>")
vim.keymap.set('n', 'ba', ":ball<cr>")
vim.keymap.set('n', 'bp', ":bprevious<cr>")
vim.keymap.set('n', 'bd', ":bd<cr>")
vim.keymap.set('n', '<leader>n', ":nohlsearch<cr>")
vim.keymap.set({'i','c'}, 'ò', "`")
vim.keymap.set({'i','c'}, 'ï', ":")
vim.keymap.set({'i','c'}, 'ö', '"')
vim.keymap.set({'i','c'}, '€', "$")
vim.keymap.set({'i','c'}, '£', "$")
vim.keymap.set({'i','c'}, 'ß', "$")
vim.keymap.set({'i','c'}, 'ẞ', "$")
vim.keymap.set({'i','c'}, 'ô', "^")
vim.keymap.set({'i','c'}, 'ℓ', "#")
vim.keymap.set({'i','c'}, '¹', "!")
vim.keymap.set({'i','c'}, '²', "@")
vim.keymap.set({'i','c'}, '³', "#")
vim.keymap.set({'i','c'}, '⁴', "$")
vim.keymap.set({'i','c'}, '⁵', "%")
vim.keymap.set({'i','c'}, '⁶', "^")
vim.keymap.set({'i','c'}, '⁷', "&")
vim.keymap.set({'i','c'}, '⁸', "*")
vim.keymap.set({'i','c'}, 'ñ', "~")
vim.keymap.set({'i','c'}, '§', "@")
vim.keymap.set('i', '—', "<Tab>")
vim.keymap.set('i', '…', "<Tab>")
vim.keymap.set('i', '°', "!")
vim.keymap.set("n", "<leader>c1", "<Cmd>:set cmdheight=1<cr>")
-- stay in visual mode after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
-- folds {{{
vim.keymap.set('n', '<Space>', "za")
vim.keymap.set("i", "<C-f>o", "--{{{")
vim.keymap.set("i", "<C-f>c", "--}}}")
--}}}


if vim.env.USER == "user"  then
  -- vim.keymap.set('n', 'ga', '<Plug>(UnicodeGA)')

  -- Do not remove under any circumstances {{{
  -- this is required for autopairs and coc to play nicely together
  -- see https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin
  -- it took me hours to troubleshoot this bullshit
  -- I fucking mean it {{{

  local remap = vim.api.nvim_set_keymap
  local npairs = require('nvim-autopairs')
  npairs.setup({map_cr=false})

  _G.MUtils= {}

  MUtils.completion_confirm=function()
      if vim.fn["coc#pum#visible"]() ~= 0  then
         return vim.fn["coc#pum#confirm"]()
     else
         return npairs.autopairs_cr()
     end
  end

  remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
  ---}}}
  ---}}}
end
