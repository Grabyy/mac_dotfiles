local gruv_setup, gruv = pcall(require, "gruvbox-material")
if not gruv_setup then
	return
end

gruv.setup({
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
    -- New option replaces `signs.highlight`
    force_background = true,  -- or false, see note below
  },
  customize = nil, -- customize the theme in any way you desire, see below what this
})
