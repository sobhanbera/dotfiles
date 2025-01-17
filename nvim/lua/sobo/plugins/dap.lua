return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"node2",
			},
		},
		-- mason-nvim-dap is loaded when nvim-dap loads
		config = function() end,
	},

	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
		keys = {
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(
						--vim.fn.input("Breakpoint condition: ")
					)
				end,
				desc = "Breakpoint Condition",
			},
			{
				"<leader>dg",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>c",
				function()
					require("dap").continue()
				end,
			},
			{
				"<C-'>",
				function()
					require("dap").step_over()
				end,
			},
			{
				"<C-;>",
				function()
					require("dap").step_into()
				end,
			},
			{
				"<C-:>",
				function()
					require("dap").step_out()
				end,
			},
		},
		config = function()
			-- changing the sign for breakpoints
			-- vim.fn.sign_define("DapBreakpoint", {
			-- 	text = "",
			-- 	texthl = "#AF0000",
			-- 	linehl = "",
			-- 	numhl = "",
			-- })

			local js_dap = require("dap-vscode-js")
			local dapui = require("dapui")
			local dap = require("dap")

			js_dap.setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = {
					"pwa-chrome",
					"pwa-msedge",
					"node-terminal",
					"pwa-extensionHost",
					"node2",
				},
			})

			dapui.setup()

			-- for _, language in ipairs({ "typescript", "javascript" }) do
			-- 	dap.configurations[language] = {
			-- 		{
			-- 			type = "pwa-node",
			-- 			request = "attach",
			-- 			processId = require("dap.utils").pick_process,
			-- 			name = "Attach debugger to existing `node --inspect` process",
			-- 			sourceMaps = true,
			-- 			resolveSourceMapLocations = {
			-- 				"${workspaceFolder}/**",
			-- 				"!**/node_modules/**",
			-- 			},
			-- 			cwd = "${workspaceFolder}/src",
			-- 			skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
			-- 		},
			--
			-- 		-- only if language is javascript, offer this debug action
			-- 		language == "javascript"
			-- 				and {
			-- 					type = "pwa-node",
			-- 					request = "launch",
			-- 					name = "Launch file in new node process",
			-- 					program = "${file}",
			-- 					cwd = "${workspaceFolder}",
			-- 				}
			-- 			or nil,
			-- 	}
			-- end

			dap.configurations = {
				javascript = {
					{
						type = "node2",
						name = "Launch",
						request = "launch",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
						protocol = "inspector",
						console = "integratedTerminal",
					},
					{
						type = "node2",
						name = "Attach",
						request = "attach",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
						protocol = "inspector",
						console = "integratedTerminal",
					},
				},
			}

			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
			}

			-- event listeners
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true })
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
}
