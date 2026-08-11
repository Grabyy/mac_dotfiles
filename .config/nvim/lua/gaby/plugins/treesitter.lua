-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

vim.filetype.add({
  extension = { nf = "nextflow" },
  filename = { [".nf"] = "nextflow" },
})

vim.treesitter.language.register("groovy", "nextflow")

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"bash",
		"lua",
		"vim",
		"python",
		"markdown",
		"markdown_inline",
		"r",
		"rnoweb",
		"yaml",
	},
	-- auto install above language parsers
	auto_install = true,
})
