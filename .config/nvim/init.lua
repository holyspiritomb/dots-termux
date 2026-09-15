vim.g.loaded_provider_perl = 0
vim.g.loaded_provider_ruby = 0
require('options')
require('keymapping')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    {
      import = "plugins"
    },
  },
  install = {
    colorscheme = {"lavender"},
  },
  ui = {
    border = "none",
  },
  checker = {
    enabled = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "editorconfig",
        "matchit",
        "rplugin",
      },
    },
  },
})

vim.keymap.set("n", "<leader>l", ":Lazy<cr>")
vim.keymap.set("n", "<leader>lu", ":Lazy update<cr>")
vim.keymap.set("n", "<leader>ls", ":Lazy sync<cr>")
vim.keymap.set("n", "<leader>lh", ":Lazy home<cr>")

require'nvim-treesitter'.setup {
    -- A directory to install the parsers and queries to.
    -- Defaults to the `stdpath('data')/site` dir.
    -- install_dir = "/some/path/to/store/parsers",
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'bash',
    'css',
    'gitignore',
    'html',
    'ini',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'requirements',
    'scss',
    'sh',
    'tmux',
    'toml',
    'typescript',
    'xml',
    'yaml',
    'zsh',
  },
  callback = function() vim.treesitter.start() end,
})

vim.cmd([[colorscheme lavender]])
