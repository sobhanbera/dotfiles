-- +-----------------------------------------------------+
-- |                LSP SIGNATURE CONFIG                 |
-- +-----------------------------------------------------+
local on_attach = function(client, bufnr)
	-- since we are using the null ls formatting to the actual default formatting should be disabled
	-- we are disabling for tsserver only
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
		-- client.resolved_capabilities.document_formatting = false
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
		max_width = 150,
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
		shadow_guibg = "#015e99",
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
	buf_set_keymap("n", "Z", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
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
-- |                  NVIM CMP CONFIGS                   |
-- +-----------------------------------------------------+
local luasnip = require("luasnip")
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
	window = {
		documentation = cmp.config.window.bordered(),
		-- completion = cmp.config.window.bordered(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = false,
			maxwidth = 45,
			menu = {
				buffer = "BUF",
				nvim_lsp = "LSP",
				nvim_lua = "API",
				path = "PATH",
				luasnip = "SNIP",
			},
		}),
	},
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<CR>"] = cmp.mapping(
			cmp.mapping.confirm(),
			{ "i", "c" } -- enter-completion will work both on command mode and insert mode
		),
		-- ctrl + space + c to show completion menu
		["<C-S-l>"] = cmp.mapping.complete(),
		["ESC"] = cmp.mapping.close(),
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
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "tailwindcss" },
})

local nvim_lsp = require("lspconfig") -- official lsp config :)
local servers = {
	"tsserver",
	"pyright",
	"clangd",
	"html",
	"cssls",
	"emmet_ls",
	"vimls",
	"eslint",
	"dockerls",
	"jsonls",
	"emmet_ls",
	"gopls",
	"kotlin_language_server",
	"tailwindcss",
} --, 'cssmodules_ls'}
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
	if lsp == "clangd" then
		-- this is required or clangd will be a bit annoying
		-- clangd will show (warning: multiple different client offset_encoding detected for buffer, this is not supported yet)...
		local cpp_capabilities = vim.lsp.protocol.make_client_capabilities()
		cpp_capabilities.offsetEncoding = { "utf-16" }

		nvim_lsp["clangd"].setup({
			on_attach = on_attach,
			capabilities = cpp_capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		})
	else
		nvim_lsp[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end
end

-- " +-----------------------------------------------------+ "
-- " |            ATTACHING RUST LANG SERVER               |
-- " +-----------------------------------------------------+ "
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			checkOnSave = { command = "clippy" },
			cargo = { loadOutDirsFromCheck = true },
			procMacro = { enable = true },
		},
	},
})
require("rust-tools").setup({})

-- " +-----------------------------------------------------+ "
-- " |            ATTACHING LUA LANG SERVER                |
-- " +-----------------------------------------------------+ "
-- local runtime_path = vim.split(package.path, ";")
local username = vim.fn.expand("$USER")
local lua_root_path = "/Users/" .. username .. "/.config/nvim/langserver/lua-language-server"
local lua_binary = lua_root_path .. "/bin/lua-language-server"
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	-- capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	cmd = { lua_binary, "-E", lua_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				-- library = vim.api.nvim_get_runtime_file("", true),
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
				preloadFileSize = 10000, -- this will make sure files are loaded well for *.lua
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = true,
			},
		},
	},
})
vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"
