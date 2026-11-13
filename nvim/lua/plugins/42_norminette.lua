local norm_setup, norm = pcall(require, "42norm")
if not norm_setup then
	return
end

norm.setup({
  format_on_save = false,
  header_on_save = false,
  lint_on_change = true,
  timeout = 3000,
  ignore = {},
})

-- vim.keymap.set("n", "<F5>", norm.check_norms, { desc = "Run diagnostics" })
-- vim.keymap.set("n", "<C-f>", norm.format, { desc = "Format buffer" })
-- vim.keymap.set("n", "<F1>", function()
--   require("42norm.header").stdheader()
-- end, { desc = "Insert 42 header" })

vim.api.nvim_create_user_command("Norminette", function()
  require("42norm").check_norms()
end, {})

vim.api.nvim_create_user_command("Format42", function()
  require("42norm").format()
end, {})

vim.api.nvim_create_user_command("Stdheader", function()
  require("42norm.header").stdheader()
end, {})
