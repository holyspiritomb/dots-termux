-- vim.opt.termguicolors = true
--[[ vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 ]]
vim.g.loaded_2html_plugin = 0
vim.g.loaded_spellfile_plugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_gzip = 0
vim.g.loaded_matchit = 0
vim.g.loaded_tutor_mode_plugin = 0
vim.opt.showmode = false
vim.opt.mouse = 'a'
vim.opt.smarttab = true
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.wildignorecase = true
vim.opt.wildmenu = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.foldmethod = "marker"
-- vim.opt.runtimepath:append { "/usr/share/nvim/site" }
vim.opt.runtimepath:append { "~/.local/share/nvim/site" }
if vim.env.USER == "user"  then
  vim.g.node_host_prog = "/usr/bin/neovim-node-host"
  vim.opt.packpath:append { "/usr/share/nvim/site" }
  vim.treesitter.language.register('python', 'recipe')
end


vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
  group = filetype_commands_group,
  pattern = "*.txt",
  callback = function()
    vim.cmd([[IBLDisable]])
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
  group = filetype_commands_group,
  pattern = {"*.[c|m]js", "*.js", "*.jsx", "*.ts*", "eslint.config.*js", "*.lua"},
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
  end,
})
