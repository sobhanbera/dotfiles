local M = {}

local defaults = {
	bg = "#0f1218",
	bg_alt = "#151a22",
	bg_highlight = "#1d2430",
	bg_popup = "#1a202b",
	bg_float = "#121722",
	bg_visual = "#2a3140",
	bg_search = "#334060",

	fg = "#d7dbe5",
	fg_alt = "#b7c0d1",
	fg_inactive = "#7f8796",
	comment = "#6b7282",

	red = "#e06c75",
	orange = "#d19a66",
	yellow = "#e5c07b",
	green = "#98c379",
	cyan = "#56b6c2",
	blue = "#61afef",
	purple = "#c678dd",
	magenta = "#d66fd1",
	teal = "#4ec9b0",

	border = "#2b3242",
	selection = "#3a455a",

	diff_add = "#1b2b20",
	diff_change = "#1c2733",
	diff_delete = "#2d1b1b",
	diff_text = "#253248",
}

vim.g.sobo_colors = vim.g.sobo_colors or {}
local user_override = vim.g.sobo_colors.amp or {}
local colors = vim.tbl_extend("force", {}, defaults, user_override)

vim.g.sobo_colors.amp = colors
vim.g.sobo_colors.current = colors

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.apply()
	vim.opt.termguicolors = true
	vim.o.background = "dark"
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "amp"

	-- Core UI
	hi("Normal", { fg = colors.fg, bg = colors.bg })
	hi("NormalNC", { fg = colors.fg_inactive, bg = colors.bg })
	hi("NormalFloat", { fg = colors.fg, bg = colors.bg_float })
	hi("FloatBorder", { fg = colors.border, bg = colors.bg_float })
	hi("FloatTitle", { fg = colors.fg_alt, bg = colors.bg_float, bold = true })
	hi("ColorColumn", { bg = colors.bg_alt })
	hi("CursorLine", { bg = colors.bg_highlight })
	hi("CursorColumn", { bg = colors.bg_highlight })
	hi("CursorLineNr", { fg = colors.fg, bg = colors.bg_highlight, bold = true })
	hi("LineNr", { fg = colors.comment })
	hi("SignColumn", { fg = colors.fg, bg = colors.bg })
	hi("VertSplit", { fg = colors.border, bg = colors.bg })
	hi("WinSeparator", { fg = colors.border, bg = colors.bg })
	hi("Visual", { bg = colors.bg_visual })
	hi("Search", { fg = colors.fg, bg = colors.bg_search })
	hi("IncSearch", { fg = colors.bg, bg = colors.yellow, bold = true })
	hi("MatchParen", { fg = colors.yellow, bold = true })
	hi("Pmenu", { fg = colors.fg, bg = colors.bg_popup })
	hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
	hi("PmenuSbar", { bg = colors.bg_alt })
	hi("PmenuThumb", { bg = colors.border })
	hi("StatusLine", { fg = colors.fg, bg = colors.bg_alt })
	hi("StatusLineNC", { fg = colors.fg_inactive, bg = colors.bg_alt })
	hi("TabLine", { fg = colors.fg_inactive, bg = colors.bg_alt })
	hi("TabLineSel", { fg = colors.fg, bg = colors.bg })
	hi("TabLineFill", { fg = colors.fg_inactive, bg = colors.bg_alt })
	hi("Title", { fg = colors.blue, bold = true })
	hi("Question", { fg = colors.blue })
	hi("MoreMsg", { fg = colors.green })
	hi("ModeMsg", { fg = colors.fg })
	hi("WarningMsg", { fg = colors.orange })
	hi("ErrorMsg", { fg = colors.red, bold = true })
	hi("Directory", { fg = colors.blue })
	hi("NonText", { fg = colors.border })
	hi("EndOfBuffer", { fg = colors.bg })
	hi("Whitespace", { fg = colors.border })
	hi("Folded", { fg = colors.fg_inactive, bg = colors.bg_alt })
	hi("FoldColumn", { fg = colors.fg_inactive, bg = colors.bg })
	hi("QuickFixLine", { bg = colors.bg_highlight })

	-- Diff
	hi("DiffAdd", { bg = colors.diff_add })
	hi("DiffChange", { bg = colors.diff_change })
	hi("DiffDelete", { bg = colors.diff_delete })
	hi("DiffText", { bg = colors.diff_text })

	-- Diagnostics
	hi("DiagnosticError", { fg = colors.red })
	hi("DiagnosticWarn", { fg = colors.yellow })
	hi("DiagnosticInfo", { fg = colors.blue })
	hi("DiagnosticHint", { fg = colors.cyan })
	hi("DiagnosticSignError", { fg = colors.red, bg = colors.bg })
	hi("DiagnosticSignWarn", { fg = colors.yellow, bg = colors.bg })
	hi("DiagnosticSignInfo", { fg = colors.blue, bg = colors.bg })
	hi("DiagnosticSignHint", { fg = colors.cyan, bg = colors.bg })
	hi("DiagnosticUnderlineError", { sp = colors.red, undercurl = true })
	hi("DiagnosticUnderlineWarn", { sp = colors.yellow, undercurl = true })
	hi("DiagnosticUnderlineInfo", { sp = colors.blue, undercurl = true })
	hi("DiagnosticUnderlineHint", { sp = colors.cyan, undercurl = true })

	-- LSP
	hi("LspReferenceText", { bg = colors.bg_highlight })
	hi("LspReferenceRead", { bg = colors.bg_highlight })
	hi("LspReferenceWrite", { bg = colors.bg_highlight })

	-- Git signs
	hi("GitSignsAdd", { fg = colors.green })
	hi("GitSignsChange", { fg = colors.blue })
	hi("GitSignsDelete", { fg = colors.red })

	-- Syntax
	hi("Comment", { fg = colors.comment, italic = true })
	hi("Constant", { fg = colors.cyan })
	hi("String", { fg = colors.green })
	hi("Character", { fg = colors.green })
	hi("Number", { fg = colors.orange })
	hi("Boolean", { fg = colors.orange })
	hi("Float", { fg = colors.orange })
	hi("Identifier", { fg = colors.fg })
	hi("Function", { fg = colors.blue })
	hi("Statement", { fg = colors.purple })
	hi("Conditional", { fg = colors.purple })
	hi("Repeat", { fg = colors.purple })
	hi("Label", { fg = colors.purple })
	hi("Operator", { fg = colors.fg_alt })
	hi("Keyword", { fg = colors.purple })
	hi("Exception", { fg = colors.purple })
	hi("PreProc", { fg = colors.magenta })
	hi("Include", { fg = colors.magenta })
	hi("Define", { fg = colors.magenta })
	hi("Macro", { fg = colors.magenta })
	hi("Type", { fg = colors.yellow })
	hi("StorageClass", { fg = colors.yellow })
	hi("Structure", { fg = colors.yellow })
	hi("Typedef", { fg = colors.yellow })
	hi("Special", { fg = colors.teal })
	hi("SpecialChar", { fg = colors.teal })
	hi("Tag", { fg = colors.blue })
	hi("Delimiter", { fg = colors.fg_alt })
	hi("SpecialComment", { fg = colors.comment })
	hi("Underlined", { underline = true })
	hi("Bold", { bold = true })
	hi("Italic", { italic = true })

	-- Treesitter
	hi("@comment", { fg = colors.comment, italic = true })
	hi("@string", { fg = colors.green })
	hi("@number", { fg = colors.orange })
	hi("@boolean", { fg = colors.orange })
	hi("@float", { fg = colors.orange })
	hi("@function", { fg = colors.blue })
	hi("@function.builtin", { fg = colors.cyan })
	hi("@function.call", { fg = colors.blue })
	hi("@method", { fg = colors.blue })
	hi("@constructor", { fg = colors.yellow })
	hi("@parameter", { fg = colors.fg })
	hi("@keyword", { fg = colors.purple })
	hi("@keyword.function", { fg = colors.purple })
	hi("@keyword.return", { fg = colors.purple })
	hi("@conditional", { fg = colors.purple })
	hi("@repeat", { fg = colors.purple })
	hi("@operator", { fg = colors.fg_alt })
	hi("@type", { fg = colors.yellow })
	hi("@type.builtin", { fg = colors.yellow })
	hi("@field", { fg = colors.fg })
	hi("@property", { fg = colors.fg })
	hi("@variable", { fg = colors.fg })
	hi("@variable.builtin", { fg = colors.cyan })
	hi("@constant", { fg = colors.cyan })
	hi("@constant.builtin", { fg = colors.cyan })
	hi("@punctuation.delimiter", { fg = colors.fg_alt })
	hi("@punctuation.bracket", { fg = colors.fg_alt })
	hi("@punctuation.special", { fg = colors.teal })
	hi("@tag", { fg = colors.blue })
	hi("@tag.attribute", { fg = colors.cyan })
	hi("@tag.delimiter", { fg = colors.fg_alt })

	-- Telescope
	hi("TelescopeNormal", { fg = colors.fg, bg = colors.bg_float })
	hi("TelescopeBorder", { fg = colors.border, bg = colors.bg_float })
	hi("TelescopePromptNormal", { fg = colors.fg, bg = colors.bg_popup })
	hi("TelescopePromptBorder", { fg = colors.border, bg = colors.bg_popup })
	hi("TelescopeSelection", { bg = colors.bg_highlight })
	hi("TelescopeMatching", { fg = colors.yellow, bold = true })
end

function M.setup(opts)
	if opts and type(opts) == "table" then
		colors = vim.tbl_extend("force", {}, colors, opts)
		vim.g.sobo_colors.amp = colors
		vim.g.sobo_colors.current = colors
	end
	M.apply()
end

M.colors = colors

return M
