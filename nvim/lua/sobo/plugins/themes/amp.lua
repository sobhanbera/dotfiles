local M = {}

local THEME_NAME = "amp"
local default_palette = {
	bg = "#161616",
	bg_alt = "#0F0F0F",
	bg_float = "#1A1A1A",
	bg_highlight = "#1E1E1E",

	fg = "#F2ECDD",
	fg_dim = "#B8AFA0",
	fg_gutter = "#627987",
	fg_inactive = "#8A8477",

	accent = "#E7894C",
	accent_alt = "#E3A25A",
	border = "#262626",

	red = "#D9634F",
	yellow = "#E3A25A",
	blue = "#6A9FCC",
	green = "#7C9B96",
	purple = "#B98BA4",
	cyan = "#8FC4C4",
	orange = "#E7894C",
	redDimmed = "#3F1E1A",
	yellowDimmed = "#3A2F1C",
	blueDimmed = "#1E2A3F",
	greenDimmed = "#24332F",
	purpleDimmed = "#2E2233",
	cyanDimmed = "#163233",
	orangeDimmed = "#3B2417",

	white = "#F2ECDD",
	black = "#161616",
	gray = "#627987",
	darkgray = "#1E1E1E",

	selection = "#6B4A2E",
	search = "#5A4A2B",
	visual = "#6B4233",
	comment = "#627987",
	string = "#7C9B96",
	number = "#E3A25A",
	boolean = "#E7894C",
	function_color = "#6A9FCC",
	type = "#E3C888",
	identifier = "#F2ECDD",
}

local function apply_highlights(palette, styles)
	local hl = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	local italic = styles.italic or false
	local bold = styles.bold or false

	-- Core
	hl("Normal", { fg = palette.fg, bg = palette.bg })
	hl("NormalNC", { fg = palette.fg_dim, bg = palette.bg })
	hl("Comment", { fg = palette.comment, italic = italic })
	hl("Constant", { fg = palette.number })
	hl("String", { fg = palette.string })
	hl("Character", { fg = palette.string })
	hl("Number", { fg = palette.number })
	hl("Boolean", { fg = palette.boolean })
	hl("Float", { fg = palette.number })
	hl("Identifier", { fg = palette.identifier })
	hl("Function", { fg = palette.function_color })
	hl("Statement", { fg = palette.red })
	hl("Conditional", { fg = palette.red })
	hl("Repeat", { fg = palette.red })
	hl("Label", { fg = palette.orange })
	hl("Operator", { fg = palette.red })
	hl("Keyword", { fg = palette.red })
	hl("Exception", { fg = palette.red })
	hl("PreProc", { fg = palette.orange })
	hl("Include", { fg = palette.orange })
	hl("Define", { fg = palette.orange })
	hl("Macro", { fg = palette.orange })
	hl("PreCondit", { fg = palette.orange })
	hl("Type", { fg = palette.type })
	hl("StorageClass", { fg = palette.type })
	hl("Structure", { fg = palette.type })
	hl("Typedef", { fg = palette.type })
	hl("Special", { fg = palette.orange })
	hl("SpecialChar", { fg = palette.orange })
	hl("Tag", { fg = palette.red })
	hl("Delimiter", { fg = palette.fg_dim })
	hl("SpecialComment", { fg = palette.comment, italic = italic })
	hl("Debug", { fg = palette.orange })
	hl("Underlined", { fg = palette.blue, underline = true })
	hl("Error", { fg = palette.red, bg = palette.red })
	hl("Todo", { fg = palette.accent, bold = bold })

	-- UI
	hl("ColorColumn", { bg = palette.bg_highlight })
	hl("CursorLine", { bg = palette.bg_highlight })
	hl("CursorLineNr", { fg = palette.accent })
	hl("LineNr", { fg = palette.fg_gutter })
	hl("CursorColumn", { bg = palette.bg_highlight })
	hl("SignColumn", { fg = palette.fg_gutter, bg = palette.bg })
	hl("VertSplit", { fg = palette.border, bg = palette.bg })
	hl("WinSeparator", { fg = palette.border, bg = palette.bg })
	hl("MatchParen", { fg = palette.accent, bg = palette.bg_highlight })
	hl("Visual", { bg = palette.visual })
	hl("Search", { bg = palette.search })
	hl("IncSearch", { fg = palette.bg, bg = palette.accent })
	hl("Pmenu", { fg = palette.fg, bg = palette.bg_float })
	hl("PmenuSel", { fg = palette.fg, bg = palette.bg_highlight })
	hl("PmenuSbar", { bg = palette.bg_float })
	hl("PmenuThumb", { bg = palette.fg_gutter })
	hl("FloatBorder", { fg = palette.border, bg = palette.bg_float })
	hl("FloatTitle", { fg = palette.accent, bg = palette.bg_float })
	hl("NormalFloat", { fg = palette.fg, bg = palette.bg_float })
	hl("TabLine", { fg = palette.fg_dim, bg = palette.bg })
	hl("TabLineSel", { fg = palette.fg, bg = palette.bg })
	hl("TabLineFill", { fg = palette.fg_dim, bg = palette.bg_alt })
	hl("Title", { fg = palette.accent, bold = bold })
	hl("NonText", { fg = palette.fg_gutter })
	hl("Whitespace", { fg = palette.fg_gutter })
	hl("Folded", { fg = palette.fg_dim, bg = palette.bg_highlight })
	hl("FoldColumn", { fg = palette.fg_gutter, bg = palette.bg })
	hl("Directory", { fg = palette.blue })
	hl("QuickFixLine", { bg = palette.bg_highlight })
	hl("Conceal", { fg = palette.fg_dim })

	-- Diff
	hl("DiffAdd", { bg = palette.green, fg = palette.green })
	hl("DiffChange", { bg = palette.blue, fg = palette.blue })
	hl("DiffDelete", { bg = palette.red, fg = palette.red })
	hl("DiffText", { bg = palette.yellow, fg = palette.yellow })

	-- Spelling
	hl("SpellBad", { sp = palette.red, undercurl = true })
	hl("SpellCap", { sp = palette.blue, undercurl = true })
	hl("SpellLocal", { sp = palette.cyan, undercurl = true })
	hl("SpellRare", { sp = palette.purple, undercurl = true })

	-- Diagnostics
	hl("DiagnosticError", { fg = palette.red, bg = 'NONE' })
	hl("DiagnosticWarn", { fg = palette.yellow, bg = 'NONE' })
	hl("DiagnosticInfo", { fg = palette.blue, bg = 'NONE' })
	hl("DiagnosticHint", { fg = palette.cyan, bg = 'NONE' })
	hl("DiagnosticOk", { fg = palette.green, bg = 'NONE' })
	hl("DiagnosticVirtualTextError", { fg = palette.red, bg = 'NONE' })
	hl("DiagnosticVirtualTextWarn", { fg = palette.yellow, bg = 'NONE' })
	hl("DiagnosticVirtualTextInfo", { fg = palette.blue, bg = 'NONE' })
	hl("DiagnosticVirtualTextHint", { fg = palette.cyan, bg = 'NONE' })
	hl("DiagnosticUnderlineError", { sp = palette.red, undercurl = true })
	hl("DiagnosticUnderlineWarn", { sp = palette.yellow, undercurl = true })
	hl("DiagnosticUnderlineInfo", { sp = palette.blue, undercurl = true })
	hl("DiagnosticUnderlineHint", { sp = palette.cyan, undercurl = true })

	-- LSP
	hl("LspReferenceText", { bg = palette.bg_highlight })
	hl("LspReferenceRead", { bg = palette.bg_highlight })
	hl("LspReferenceWrite", { bg = palette.bg_highlight })

	-- Treesitter
	hl("@comment", { fg = palette.comment, italic = italic })
	hl("@string", { fg = palette.string })
	hl("@string.regex", { fg = palette.cyan })
	hl("@string.escape", { fg = palette.green })
	hl("@character", { fg = palette.string })
	hl("@number", { fg = palette.number })
	hl("@boolean", { fg = palette.boolean })
	hl("@float", { fg = palette.number })
	hl("@function", { fg = palette.function_color })
	hl("@function.call", { fg = palette.function_color })
	hl("@method", { fg = palette.function_color })
	hl("@method.call", { fg = palette.function_color })
	hl("@constructor", { fg = palette.blue })
	hl("@parameter", { fg = palette.fg })
	hl("@variable", { fg = palette.fg })
	hl("@variable.builtin", { fg = palette.orange })
	hl("@constant", { fg = palette.number })
	hl("@constant.builtin", { fg = palette.boolean })
	hl("@constant.macro", { fg = palette.orange })
	hl("@type", { fg = palette.type })
	hl("@type.builtin", { fg = palette.type })
	hl("@type.definition", { fg = palette.type })
	hl("@keyword", { fg = palette.red })
	hl("@keyword.function", { fg = palette.red })
	hl("@keyword.operator", { fg = palette.red })
	hl("@operator", { fg = palette.red })
	hl("@field", { fg = palette.orange })
	hl("@property", { fg = palette.orange })
	hl("@punctuation.delimiter", { fg = palette.fg_dim })
	hl("@punctuation.bracket", { fg = palette.fg_dim })
	hl("@punctuation.special", { fg = palette.orange })
	hl("@tag", { fg = palette.red })
	hl("@tag.attribute", { fg = palette.orange })
	hl("@tag.delimiter", { fg = palette.fg_dim })
	hl("@text.title", { fg = palette.accent, bold = bold })
	hl("@text.uri", { fg = palette.blue, underline = true })
	hl("@text.literal", { fg = palette.string })
	hl("@text.reference", { fg = palette.blue })
	hl("@text.todo", { fg = palette.accent, bold = bold })
	hl("@text.note", { fg = palette.blue })
	hl("@text.warning", { fg = palette.yellow })
	hl("@text.danger", { fg = palette.red })

	-- Terminal colors
	vim.g.terminal_color_0 = palette.bg
	vim.g.terminal_color_1 = palette.red
	vim.g.terminal_color_2 = palette.green
	vim.g.terminal_color_3 = palette.yellow
	vim.g.terminal_color_4 = palette.blue
	vim.g.terminal_color_5 = palette.purple
	vim.g.terminal_color_6 = palette.cyan
	vim.g.terminal_color_7 = palette.fg
	vim.g.terminal_color_8 = palette.fg_gutter
	vim.g.terminal_color_9 = palette.orange
	vim.g.terminal_color_10 = palette.green
	vim.g.terminal_color_11 = palette.yellow
	vim.g.terminal_color_12 = palette.blue
	vim.g.terminal_color_13 = palette.purple
	vim.g.terminal_color_14 = palette.cyan
	vim.g.terminal_color_15 = palette.fg
end

function M.setup(config)
	config = config or {}
	local palette = vim.tbl_deep_extend("force", default_palette, config.palette or {})
	local styles = config.styles or { italic = true, bold = true }

	vim.o.termguicolors = true
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = THEME_NAME

	apply_highlights(palette, styles)
end

M.alias = THEME_NAME
M.palette = default_palette

return M
