return {

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = true,
			handlers = {},

			ensure_installed = {
				"node2",
			},
		},
		config = function()
			require("mason").setup()
			require("mason-nvim-dap").setup()
		end,
	},

	{
		"mfussenegger/nvim-dap",
		recommended = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({
				icons = {
					expanded = "▾",
					collapsed = "▸",
				},
				mappings = {
					expand = "<CR>",
					open = "o",
					remove = "d",
					edit = "e",
				},
				sidebar = {
					open_on_start = true,
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					width = 40,
					position = "left",
				},
				tray = {
					open_on_start = true,
					position = "bottom",
				},
				icons = {
					breakpoint = "",
					conditional = "",
					["function"] = "",
					variable = "",
					["local"] = "",
				},
			})

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
		end,
		keys = {
			{
				"<leader>dt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
		},
	},
}
