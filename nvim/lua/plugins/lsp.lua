-- +-----------------------------------------------------+
-- |                LSP SIGNATURE CONFIG                 |
-- +-----------------------------------------------------+
local on_attach = function(client, bufnr)
	-- since we are using the null ls formatting to the actual default formatting should be disabled
	-- we are disabling for tsserver only
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end

	local cfg = {
		debug = false,
		log_path = "debug_log_file_path",
		verbose = false,
		bind = true,
		doc_lines = 10,
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = true,
		hint_prefix = "🐼 ",
		hint_scheme = "String",
		hi_parameter = "LspSignatureActiveParameter",
		max_height = 12,
		max_width = 120,
		handler_opts = {
			border = "rounded",
		},
		always_trigger = false,
		auto_close_after = 20,
		extra_trigger_chars = {},
		zindex = 50,
		padding = " ",
		transparency = 100,
		shadow_blend = 36,
		shadow_guibg = "#0a0f14",
		timer_interval = 200,
		toggle_key = "<C-Space>",
	}
	local lsp_signature = require("lsp_signature")
	lsp_signature.setup(cfg)
	lsp_signature.on_attach(cfg, bufnr)

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- " +-----------------------------------------------------+ "
	-- " |                        MAPPINGS                     |
	-- " +-----------------------------------------------------+ "
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- " +-----------------------------------------------------+ "
-- " |                LSP KIND ICON CONFIG                 |
-- " +-----------------------------------------------------+ "
local lspkind = require("lspkind") -- lsp kind icons for completion menu
lspkind.init({
	with_text = false,
	mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
})

-- +-----------------------------------------------------+
-- |                 INITIALIZING LUASNIPS               |
-- +-----------------------------------------------------+
-- require("luasnip.loaders.from_vscode").lazy_load({ include = { "javascript", "typescript", "typescriptreact", "javascriptreact" } })
local luasnip = require "luasnip"
local types = require "luasnip.util.types"
require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config {
	-- This tells LuaSnip to remember to keep around the last snippet. You can jump back into it even if you move outside of the selection
	history = true,
	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
}
-- mappings for jumping forward and backward
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

-- +-----------------------------------------------------+
-- |                  NVIM CMP CONFIGS                   |
-- +-----------------------------------------------------+
local cmp = require("cmp") -- completion plugin
cmp.setup({
	experimental = {
		native_menu = false,
		-- ghost_text = true,
	},
	snippet = {
		expand = function(args)
			if not luasnip then
				return
			end
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'nvim_lua' },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			maxwidth = 45,
			menu = {
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[API]",
				path = "[PATH]",
				luasnip = "[SNIP]",
			},
		}),
	},
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<CR>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			{ "i", "c" }-- enter-completion will work both on command mode and insert mode
		),
		["<C-space>"] = cmp.mapping({
			i = cmp.mapping.complete(),
			c = function()
				if cmp.visible() then
					if not cmp.confirm({ select = true }) then
						return
					end
				else
					cmp.complete()
				end
			end,
		}),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.close(),
		['ESC'] = cmp.mapping.close(),
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,

			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0

				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,

			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
-- Use buffer source for `/` & `:` (if `native_menu` is enabled both the below won't work anymore).
-- cmp.setup.cmdline('/', { sources = { {name = 'buffer'} } })
-- cmp.setup.cmdline(':', { sources = cmp.config.sources({ {name = 'path'} }, { {name = 'cmdline'} }) })

-- " +-----------------------------------------------------+ "
-- " |                 ATTACHING DIFF LSs                  |
-- " |                  LANGUAGE SERVERS                   |
-- " | TS,JS,CPP,Java,CSS,HTML,VIM,JSON,DOCKER,PYTHON,ETC. |
-- " +-----------------------------------------------------+ "
local nvim_lsp = require("lspconfig") -- official lsp config :)
local servers = {
	"tsserver",
	"pyright",
	"html",
	"cssls",
	"emmet_ls",
	"vimls",
	"eslint",
	"dockerls",
	"jsonls",
	"emmet_ls",
} --, 'cssmodules_ls'}
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = capabilities,
	})
end

-- " +-----------------------------------------------------+ "
-- " |            ATTACHING LUA LANG SERVER                |
-- " +-----------------------------------------------------+ "
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig").sumneko_lua.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { sumneko_binary, "-E", sumneko_root_path },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"

-- extra plugins are being initialized here...
require('Comment').setup()
