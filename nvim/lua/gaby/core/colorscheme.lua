-- set colorscheme to nightfly with protected call
-- in case it isn't installed

-- values shown are defaults and will be used if not provided
require("gruvbox-material").setup({
	italics = true, -- enable italics in general
	contrast = "soft", -- set contrast, can be any of "hard", "medium", "soft"
	comments = {
		italics = true, -- enable italic comments
	},
	background = {
		transparent = true, -- set the background to transparent
	},
	float = {
		force_background = false, -- force background on floats even when background.transparent is set
		background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
		-- by the color scheme
	},
	signs = {
		highlight = true, -- whether to highlight signs
	},
	customize = nil, -- customize the theme in any way you desire, see below what this
	-- configuration accepts
})

--vim.cmd("colorscheme grubox-material")
