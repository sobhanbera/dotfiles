-- +-----------------------------------------------------+
-- |                COMMENTS IN VIM                      |
-- +-----------------------------------------------------+
-- extra plugins are being initialized here...
-- require("Comment").setup()

require('Comment').setup({
    -- pre_hook = function(ctx)
    --     return require('Comment.jsx').calculate(ctx)
    -- end,
	opleader = {
		line = "gc",
		block = "gb",
	},
	mappings = {
		line = "gcc",
		block = "gbc",
	},
})
