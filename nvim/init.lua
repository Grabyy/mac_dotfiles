require("gaby.plugins-setup")
require("gaby.core.options")
require("gaby.core.keymaps")
require("gaby.core.colorscheme")
require("gaby.plugins.comment")
require("gaby.plugins.nvim-tree")
require("gaby.plugins.telescope")
require("gaby.plugins.nvim-cmp")
require("gaby.plugins.lsp.mason")
require("gaby.plugins.lsp.lspsaga")
require("gaby.plugins.lsp.lspconfig")
require("gaby.plugins.lsp.null-ls")
require("gaby.plugins.ufo")
require("gaby.plugins.autopairs")
require("gaby.plugins.treesitter")
require("gaby.plugins.gitsigns")

--Get the vim package
vim.cmd([[
set runtimepath^=~/.config/nvim/vim-plugins/ runtimepath+=~/.config/nvim/vim-plugins/after
let &packpath = &runtimepath
source ~/.config/nvim/vim-plugins/.vimrc
]])
