local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"tpope/vim-surround",
	"vim-scripts/ReplaceWithRegister",
	"numToStr/Comment.nvim",

	"nvim-tree/nvim-tree.lua",

	"f4z3r/gruvbox-material.nvim",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "gmake",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},

	-- Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",

	-- LSP
	"neovim/nvim-lspconfig",

	-- Editing
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins-setup.lua",
  callback = function()
    vim.cmd("Lazy sync")
  end,
})
