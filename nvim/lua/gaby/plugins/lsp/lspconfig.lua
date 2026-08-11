local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	return
end

local keymap = vim.keymap
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "ﴞ ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	virtual_text = true,
})

vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
			},
		},
	},
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--offset-encoding=utf-8",
	},
	init_options = {
		fallbackFlags = {
			"-I/opt/homebrew/opt/sdl3/include",
		},
	},
	root_markers = { ".clangd", "compile_commands.json" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

vim.lsp.enable("pyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
