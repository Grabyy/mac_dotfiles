local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

	vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({
      border = "rounded",
    })
  end, opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)
end

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.HINT] = "H",
			[vim.diagnostic.severity.INFO] = "I",
		},
	},
})

-- Python
vim.lsp.config("pylsp", {
	cmd = { "pylsp" },
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lua
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
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

-- C / C++
vim.lsp.config("clangd", {
	cmd = { "clangd" },
	capabilities = capabilities,
	on_attach = on_attach,

	root_markers = {
		".clangd",
		"compile_commands.json",
	},

	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
	},
})

vim.lsp.enable({
	"pylsp",
	"lua_ls",
	"clangd",
})
