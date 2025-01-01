local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
	--- A callback that determines how a variable is displayed or whether it should be omitted
	--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
	--- @param buf number
	--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
	--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
	--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
	--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
	display_callback = function(variable, buf, stackframe, node, options)
		-- by default, strip out new line characters
		if options.virt_text_pos == "inline" then
			return " = " .. variable.value:gsub("%s+", " ")
		else
			return variable.name .. " = " .. variable.value:gsub("%s+", " ")
		end
	end,
	-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
	virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

	-- experimental features:
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})

-- Language specific configurations
-- NODE.JS
local js_based_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
for _, language in ipairs(js_based_filetypes) do
	dap.configurations[language] = {
		-- debug single nodejs files
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
		-- attaching to a running nodejs process
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
		-- debug web applications (browser like chrome and all)
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch & Debug Chrome",
			url = function()
				local co = coroutine.running()
				return coroutine.create(function()
					vim.ui.input({
						prompt = "Enter localhost URL to debug: ",
						default = "http://localhost:3000",
					}, function(url)
						if url == nil or url == "" then
							return
						else
							coroutine.resume(co, url)
						end
					end)
				end)
			end,
			webRoot = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**", "node_modules/**/*.js" },
			protocol = "inspector",
			sourceMaps = true,
			userDataDir = false,
		},
		-- divider for the launch.json derived configurations, to override them
		{
			type = "",
			request = "launch",
			name = "Launch configs (Node.js)",
		},
	}
end

-- keymaps and more
local map = require("sobo.keymaps").map

-- map("n", "dt", ":lua require'dap'.toggle_breakpoint()<CR>")
local function initLocalConfigToDebug()
	-- in this case we will be using the local launch.json configurations
	if vim.fn.filereadable(".vscode/launch.json") then
		local dap_vscode = require("dap.ext.vscode")
		dap_vscode.load_launchjs(nil, {
			["pwa-node"] = js_based_filetypes,
			["pwa-chrome"] = js_based_filetypes,
			["node"] = js_based_filetypes,
			["chrome"] = js_based_filetypes,
		})
	end
	require("dap").continue()
end
vim.keymap.set("n", "<F6>", initLocalConfigToDebug, { noremap = true, silent = true })

map("n", "<F2>", ":lua require'dap'.continue()<CR>")
map("n", "<F3>", ":lua require'dap'.step_over()<CR>")
map("n", "<F4>", ":lua require'dap'.step_into()<CR>")
map("n", "<F5>", ":lua require'dap'.step_out()<CR>")

map("n", "<leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>")
map("n", "<leader>dl", ":lua require'dap'.run_last()<CR>")

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

-- NODE.js again
require("dap-vscode-js").setup({
	-- the path to the vscode-js-debug extension
	debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/plugged/vscode-js-debug/"),
	-- adapters to use/load
	adapters = {
		"chrome",
		"node",
		"pwa-node",
		"pwa-chrome",
		"node-terminal",
	},
})

