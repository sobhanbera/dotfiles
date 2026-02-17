return {
	"mfussenegger/nvim-dap",
	-- lazy = true,
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "js-debug-adapter")
			end,
		},
		-- {
		-- 	"mxsdev/nvim-dap-vscode-js",
		-- 	lazy = true,
		-- 	cmd = { "DapInstall", "DapUninstall" },
		-- 	opts = {
		-- 		debugger_path = LazyVim.get_pkg_path("js-debug-adapter"),
		-- 		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		-- 	},
		-- },
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		if not dap.adapters["pwa-node"] then
			require("dap").adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					-- 💀 Make sure to update this path to point to your installation
					args = {
						"/Users/sobhanbera/Workspace/scripts/debuggers/jsts/src/dapDebugServer.js",
						"${port}",
					},
					-- args = {
					-- 	LazyVim.get_pkg_path(
					-- 		"js-debug-adapter",
					-- 		"/Users/sobhanbera/Workspace/scripts/debuggers/jsts/src/dapDebugServer.js"
					-- 	),
					-- 	"${port}",
					-- },
				},
			}
		end
		if not dap.adapters["node"] then
			dap.adapters["node"] = function(cb, config)
				if config.type == "node" then
					config.type = "pwa-node"
				end
				local nativeAdapter = dap.adapters["pwa-node"]
				if type(nativeAdapter) == "function" then
					nativeAdapter(cb, config)
				else
					cb(nativeAdapter)
				end
			end
		end

		local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

		local vscode = require("dap.ext.vscode")
		vscode.type_to_filetypes["node"] = js_filetypes
		vscode.type_to_filetypes["pwa-node"] = js_filetypes

		for _, language in ipairs(js_filetypes) do
			if not dap.configurations[language] then
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end
		end

		local dapui = require("dapui")
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			expand_lines = vim.fn.has("nvim-0.7"),
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "rounded", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil,
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			-- 	vim.cmd("tabfirst|tabnext")
			dapui.open({ reset = true })
		end
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		-- 	dapui.close({})
		-- end
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		-- 	dapui.close({})
		-- end

		-- Keymaps
		local map = require("sobo.core.keymaps").map
		map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", {
			desc = "Toggle Breakpoint",
		})
		map("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", {
			desc = "Continue Execution",
		})
		map("n", "<leader>dso", "<cmd>lua require('dap').step_over()<CR>", {
			desc = "Step Over",
		})
		map("n", "<leader>dsi", "<cmd>lua require('dap').step_into()<CR>", {
			desc = "Step Into",
		})
		map("n", "<leader>dsu", "<cmd>lua require('dap').step_out()<CR>", {
			desc = "Step Out",
		})
		map("n", "<leader>dk", "<cmd>lua require('dap').terminate()<CR>", {
			desc = "Terminate Debugging",
		})
		map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", {
			desc = "Open REPL",
		})
		map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", {
			desc = "Run Last Debugging Session",
		})
		map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", {
			desc = "Toggle DAP UI",
		})

		vim.cmd("hi DapBreakpointColor guifg=#e78284")
		vim.fn.sign_define("DapBreakpoint", {
			text = "●",
			texthl = "DapBreakpointColor",
			linehl = "",
			numhl = "",
		})

		-- DAP Virtual Text
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			all_references = false,
			filter_references_pattern = "<module",
			virt_text_pos = "eol",
			all_frames = false,
			virt_lines = false,
			virt_text_win_col = nil,
		})
	end,
}

-- return {
-- 	"mfussenegger/nvim-dap",
-- 	dependencies = {
-- 		"rcarriga/nvim-dap-ui",
-- 		"nvim-neotest/nvim-nio",
-- 		"theHamsta/nvim-dap-virtual-text",
-- 		"mxsdev/nvim-dap-vscode-js",
-- 		"jay-babu/mason-nvim-dap.nvim",
-- 		{
-- 			"microsoft/vscode-js-debug",
-- 			version = "1.x",
-- 			build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
-- 		},
-- 	},
-- 	config = function()
-- 		local dap = require("dap")
-- 		local dapui = require("dapui")
-- 		dapui.setup()
--
-- 		require("dap").adapters["pwa-node"] = {
-- 			type = "server",
-- 			host = "localhost",
-- 			port = "${port}",
-- 			executable = {
-- 				command = "node",
-- 				-- 💀 Make sure to update this path to point to your installation
-- 				args = { "/Users/sobhanbera/.local/share/nvim/dap/js-debug/src/dapDebugServer.js", "${port}" },
-- 			},
-- 		}
--
-- 		require("dap").configurations.javascript = {
-- 			{
-- 				type = "pwa-node",
-- 				request = "launch",
-- 				name = "Launch file",
-- 				program = "${file}",
-- 				cwd = "${workspaceFolder}",
-- 			},
-- 		}
--
-- 		local map = require("sobo.core.keymaps").map
--
-- 		map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", {
-- 			desc = "Toggle Breakpoint",
-- 		})
--
-- 		map("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", {
-- 			desc = "Continue Execution",
-- 		})
--
-- 		map("n", "<leader>dso", "<cmd>lua require('dap').step_over()<CR>", {
-- 			desc = "Step Over",
-- 		})
-- 		map("n", "<leader>dsi", "<cmd>lua require('dap').step_into()<CR>", {
-- 			desc = "Step Into",
-- 		})
-- 		map("n", "<leader>dsu", "<cmd>lua require('dap').step_out()<CR>", {
-- 			desc = "Step Out",
-- 		})
--
-- 		map("n", "<leader>dk", "<cmd>lua require('dap').terminate()<CR>", {
-- 			desc = "Terminate Debugging",
-- 		})
-- 		map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", {
-- 			desc = "Open REPL",
-- 		})
--
-- 		map("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", {
-- 			desc = "Run Last Debugging Session",
-- 		})
--
-- 		map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", {
-- 			desc = "Toggle DAP UI",
-- 		})
--
-- 		vim.cmd("hi DapBreakpointColor guifg=#e78284")
-- 		vim.fn.sign_define("DapBreakpoint", {
-- 			text = "●",
-- 			texthl = "DapBreakpointColor",
-- 			linehl = "",
-- 			numhl = "",
-- 		})
-- 	end,
-- }

-- return {
--
-- 	{
-- 		"mfussenegger/nvim-dap",
-- 		dependencies = {
-- 			"rcarriga/nvim-dap-ui",
-- 			"nvim-neotest/nvim-nio",
-- 			"nvim-treesitter/nvim-treesitter",
-- 			"theHamsta/nvim-dap-virtual-text",
-- 			"mxsdev/nvim-dap-vscode-js",
-- 		},
-- 		event = "VeryLazy",
-- 		config = function()
-- 			local dap = require("dap")
-- 			local dapui = require("dapui")
-- 			local dap_ext_vscode = require("dap.ext.vscode")
-- 			local dap_virtual_text = require("nvim-dap-virtual-text")
--
-- 			-- # Sign
-- 			vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "", linehl = "", numhl = "" })
-- 			vim.fn.sign_define("DapBreakpointCondition", { text = "🟧", texthl = "", linehl = "", numhl = "" })
-- 			vim.fn.sign_define("DapLogPoint", { text = "🟩", texthl = "", linehl = "", numhl = "" })
-- 			vim.fn.sign_define("DapStopped", { text = "🈁", texthl = "", linehl = "", numhl = "" })
-- 			vim.fn.sign_define("DapBreakpointRejected", { text = "⬜", texthl = "", linehl = "", numhl = "" })
--
-- 			-- # DAP Virtual Text
-- 			dap_virtual_text.setup({
-- 				enabled = true,
-- 				enabled_commands = true,
-- 				highlight_changed_variables = true,
-- 				highlight_new_as_changed = false,
-- 				show_stop_reason = true,
-- 				commented = false,
-- 				only_first_definition = true,
-- 				all_references = false,
-- 				filter_references_pattern = "<module",
-- 				virt_text_pos = "eol",
-- 				all_frames = false,
-- 				virt_lines = false,
-- 				virt_text_win_col = nil,
-- 			})
--
-- 			-- # DAP UI
-- 			dapui.setup({
-- 				icons = { expanded = "▾", collapsed = "▸" },
-- 				mappings = {
-- 					expand = { "<CR>", "<2-LeftMouse>" },
-- 					open = "o",
-- 					remove = "d",
-- 					edit = "e",
-- 					repl = "r",
-- 					toggle = "t",
-- 				},
-- 				expand_lines = vim.fn.has("nvim-0.7"),
-- 				layouts = {
-- 					{
-- 						elements = {
-- 							-- Elements can be strings or table with id and size keys.
-- 							{ id = "scopes", size = 0.25 },
-- 							"breakpoints",
-- 							"stacks",
-- 							"watches",
-- 						},
-- 						size = 40,
-- 						position = "right",
-- 					},
-- 					{
-- 						elements = {
-- 							{ id = "repl", size = 0.5 },
-- 							{ id = "console", size = 0.5 },
-- 						},
-- 						size = 10,
-- 						position = "bottom",
-- 					},
-- 				},
-- 				floating = {
-- 					max_height = nil, -- These can be integers or a float between 0 and 1.
-- 					max_width = nil, -- Floats will be treated as percentage of your screen.
-- 					border = "rounded", -- Border style. Can be "single", "double" or "rounded"
-- 					mappings = {
-- 						close = { "q", "<Esc>" },
-- 					},
-- 				},
-- 				windows = { indent = 1 },
-- 				render = {
-- 					max_type_length = nil,
-- 				},
-- 			})
-- 			dap.listeners.after.event_initialized["dapui_config"] = function()
-- 				vim.cmd("tabfirst|tabnext")
-- 				dapui.open()
-- 			end
-- 			-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 			--   dapui.close()
-- 			-- end
-- 			-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 			--   dapui.close()
-- 			-- end
--
-- 			-- # Keymap
-- 			-- local keymap = require("rin.utils.keymap").keymap
-- 			--
-- 			-- keymap("n", "<Leader>di", dap.toggle_breakpoint)
-- 			-- keymap("n", "<Leader>dI", ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- 			-- keymap(
-- 			-- 	"n",
-- 			-- 	"<Leader>dp",
-- 			-- 	':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>'
-- 			-- )
-- 			-- keymap("n", "<Leader>ds", ':lua require("dap").continue()<CR>')
-- 			-- keymap("n", "<Leader>dl", ':lua require("dap").run_to_cursor()<CR>')
-- 			-- keymap("n", "<Leader>dS", ':lua require("dap").disconnect()<CR>')
-- 			-- keymap("n", "<Leader>dn", ':lua require("dap").step_over()<CR>')
-- 			-- keymap("n", "<Leader>dN", ':lua require("dap").step_into()<CR>')
-- 			-- keymap("n", "<Leader>do", ':lua require("dap").step_out()<CR>')
-- 			--
-- 			-- keymap("n", "<Leader>dww", ':lua require("dapui").toggle()<CR>')
-- 			-- keymap("n", "<Leader>dw[", ':lua require("dapui").toggle(1)<CR>')
-- 			-- keymap("n", "<Leader>dw]", ':lua require("dapui").toggle(2)<CR>')
--
-- 			-- # DAP Config
-- 			require("sobo.plugins.dap.jsts")
--
-- 			-- ## DAP `launch.json`
-- 			dap_ext_vscode.load_launchjs(nil, {
-- 				["python"] = {
-- 					"python",
-- 				},
-- 				["pwa-node"] = {
-- 					"javascript",
-- 					"typescript",
-- 				},
-- 				["node"] = {
-- 					"javascript",
-- 					"typescript",
-- 				},
-- 				["cppdbg"] = {
-- 					"c",
-- 					"cpp",
-- 				},
-- 				["dlv"] = {
-- 					"go",
-- 				},
-- 			})
-- 		end,
-- 		keys = {
-- 			{
-- 				"<leader>ds",
-- 				function()
-- 					require("dap").continue()
-- 				end,
-- 				desc = "DAP Continue",
-- 			},
-- 			{
-- 				"<leader>dl",
-- 				function()
-- 					require("dap").run_to_cursor()
-- 				end,
-- 			},
-- 			{
-- 				"<leader>dS",
-- 				function()
-- 					require("dap").disconnect()
-- 				end,
-- 			},
-- 			{
-- 				"<leader>dn",
-- 				function()
-- 					require("dap").step_over()
-- 				end,
-- 			},
-- 			{
-- 				"<leader>dN",
-- 				function()
-- 					require("dap").step_into()
-- 				end,
-- 			},
-- 			{
-- 				"<leader>do",
-- 				function()
-- 					require("dap").step_out()
-- 				end,
-- 			},
-- 			{
-- 				"<leader>di",
-- 				function()
-- 					require("dap").toggle_breakpoint()
-- 				end,
-- 			},
-- 		},
-- 	},
-- }
--
-- -- return {
-- -- 	{
-- -- 		"rcarriga/nvim-dap-ui",
-- -- 		event = "VeryLazy",
-- -- 		dependencies = {
-- -- 			"nvim-neotest/nvim-nio",
-- -- 			"mfussenegger/nvim-dap",
-- -- 		},
-- -- 		config = function()
-- -- 			local dap = require("dap")
-- -- 			local dapui = require("dapui")
-- --
-- -- 			require("dapui").setup()
-- --
-- -- 			dap.listeners.after.event_initialized["dapui_config"] = function()
-- -- 				dapui.open({
-- -- 					-- reset = true
-- -- 				})
-- -- 			end
-- -- 			dap.listeners.before.event_terminated["dapui_config"] = function()
-- -- 				dapui.close({})
-- -- 			end
-- -- 			dap.listeners.before.event_exited["dapui_config"] = function()
-- -- 				dapui.close({})
-- -- 			end
-- -- 		end,
-- -- 	},
-- -- 	{
-- -- 		"mxsdev/nvim-dap-vscode-js",
-- -- 		dependencies = {
-- -- 			"mfussenegger/nvim-dap",
-- -- 			"microsoft/vscode-js-debug",
-- -- 		},
-- -- 		lazy = true,
-- -- 		cmd = { "DapInstall", "DapUninstall" },
-- -- 		opts = {
-- -- 			debugger_path = vim.fn.stdpath("data") .. "/dap_adapters/vscode-js-debug",
-- -- 			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge" },
-- -- 		},
-- -- 		config = function(_, opts)
-- -- 			require("dap-vscode-js").setup({
-- -- 				-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
-- -- 				-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
-- -- 				-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
-- -- 				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
-- -- 				-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
-- -- 				-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
-- -- 				-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- -- 			})
-- --
-- -- 			for _, language in ipairs({ "typescript", "javascript" }) do
-- -- 				require("dap").configurations[language] = {
-- -- 					{
-- -- 						{
-- -- 							type = "pwa-node",
-- -- 							request = "launch",
-- -- 							name = "Launch file",
-- -- 							program = "${file}",
-- -- 							cwd = "${workspaceFolder}",
-- -- 						},
-- -- 						{
-- -- 							type = "pwa-node",
-- -- 							request = "attach",
-- -- 							name = "Attach",
-- -- 							processId = require("dap.utils").pick_process,
-- -- 							cwd = "${workspaceFolder}",
-- -- 						},
-- -- 					},
-- -- 				}
-- -- 			end
-- -- 		end,
-- -- 	},
-- -- 	{
-- -- 		"mfussenegger/nvim-dap",
-- -- 		config = function()
-- -- 			local dap = require("dap")
-- --
-- -- 			dap.adapters["pwa-node"] = {
-- -- 				type = "server",
-- -- 				host = "localhost",
-- -- 				-- port = "${port}",
-- -- 				executable = {
-- -- 					command = "node",
-- -- 					args = {
-- -- 						vim.fn.stdpath("data") .. "/dap_adapters/vscode-js-debug/dist/src/vsDebugServer.js",
-- -- 						-- "--server=true",
-- -- 					},
-- -- 				},
-- -- 			}
-- -- 			-- dap.adapters["pwa-node"] = function(callback, _)
-- -- 			-- 	local port = 9229 -- or use 0 for a random port
-- -- 			-- 	local handle
-- -- 			-- 	local pid_or_err
-- -- 			-- 	local opts = {
-- -- 			-- 		stdio = { nil, nil, nil },
-- -- 			-- 		args = {
-- -- 			-- 			vim.fn.stdpath("data") .. "/dap_adapters/vscode-js-debug/dist/js-debug/src/vsDebugServer.js",
-- -- 			-- 			"--server=" .. port,
-- -- 			-- 		},
-- -- 			-- 		detached = true,
-- -- 			-- 	}
-- -- 			-- 	handle, pid_or_err = vim.loop.spawn("node", opts, function(code)
-- -- 			-- 		handle:close()
-- -- 			-- 		if code ~= 0 then
-- -- 			-- 			print("js-debug exited with code", code)
-- -- 			-- 		end
-- -- 			-- 	end)
-- -- 			-- 	assert(handle, "Error running node debug server: " .. tostring(pid_or_err))
-- -- 			-- 	vim.defer_fn(function()
-- -- 			-- 		callback({ type = "server", host = "127.0.0.1", port = port })
-- -- 			-- 	end, 100)
-- -- 			-- end
-- --
-- -- 			-- dap.adapters["pwa-node"] = {
-- -- 			-- 	type = "server",
-- -- 			-- 	host = "127.0.0.1",
-- -- 			-- 	port = 8123,
-- -- 			-- 	executable = {
-- -- 			-- 		command = "js-debug-adapter",
-- -- 			-- 	},
-- -- 			-- }
-- --
-- -- 			for _, language in ipairs({ "typescript", "javascript" }) do
-- -- 				dap.configurations[language] = {
-- -- 					{
-- -- 						type = "pwa-node",
-- -- 						request = "launch",
-- -- 						name = "Launch file",
-- -- 						program = "${file}",
-- -- 						cwd = vim.fn.getcwd(),
-- -- 						runtimeExecutable = "node",
-- -- 						console = "integratedTerminal",
-- -- 					},
-- -- 				}
-- --
-- -- 				-- dap.configurations[language] = {
-- -- 				-- 	{
-- -- 				-- 		type = "pwa-node",
-- -- 				-- 		request = "launch",
-- -- 				-- 		name = "Launch file",
-- -- 				-- 		program = "${file}",
-- -- 				-- 		cwd = "${workspaceFolder}",
-- -- 				-- 		runtimeExecutable = "node",
-- -- 				-- 		-- sourceMaps = true,
-- -- 				-- 		-- protocol = "inspector",
-- -- 				-- 		-- console = "integratedTerminal",
-- -- 				-- 	},
-- -- 				-- }
-- -- 			end
-- -- 		end,
-- -- 		keys = {
-- -- 			{
-- -- 				"<leader>dr",
-- -- 				function()
-- -- 					require("dap").continue()
-- -- 				end,
-- -- 			},
-- -- 			-- {
-- -- 			-- 	"<C-'>",
-- -- 			-- 	function()
-- -- 			-- 		require("dap").step_over()
-- -- 			-- 	end,
-- -- 			-- },
-- -- 			-- {
-- -- 			-- 	"<C-;>",
-- -- 			-- 	function()
-- -- 			-- 		require("dap").step_into()
-- -- 			-- 	end,
-- -- 			-- },
-- -- 			-- {
-- -- 			-- 	"<C-:>",
-- -- 			-- 	function()
-- -- 			-- 		require("dap").step_out()
-- -- 			-- 	end,
-- -- 			-- },
-- -- 			{
-- -- 				"<leader>dg",
-- -- 				function()
-- -- 					require("dap").toggle_breakpoint()
-- -- 				end,
-- -- 			},
-- -- 		},
-- -- 	},
-- -- }
--
-- -- return {
-- -- 	{
-- -- 		"jay-babu/mason-nvim-dap.nvim",
-- -- 		dependencies = "mason.nvim",
-- -- 		cmd = { "DapInstall", "DapUninstall" },
-- -- 		opts = {
-- -- 			-- Makes a best effort to setup the various debuggers with
-- -- 			-- reasonable debug configurations
-- -- 			automatic_installation = true,
-- --
-- -- 			-- You can provide additional configuration to the handlers,
-- -- 			-- see mason-nvim-dap README for more information
-- -- 			handlers = {},
-- --
-- -- 			-- You'll need to check that you have the required things installed
-- -- 			-- online, please don't ask me how to install them :)
-- -- 			ensure_installed = {
-- -- 				-- Update this to ensure that you have the debuggers for the langs you want
-- -- 				"node2",
-- -- 			},
-- -- 		},
-- -- 		-- mason-nvim-dap is loaded when nvim-dap loads
-- -- 		config = function() end,
-- -- 	},
-- --
-- -- 	{
-- -- 		"mfussenegger/nvim-dap",
-- -- 		lazy = true,
-- -- 		dependencies = {
-- -- 			"rcarriga/nvim-dap-ui",
-- -- 			"nvim-neotest/nvim-nio",
-- -- 			"mxsdev/nvim-dap-vscode-js",
-- -- 			{
-- -- 				"microsoft/vscode-js-debug",
-- -- 				version = "1.x",
-- -- 				build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
-- -- 			},
-- -- 			{
-- -- 				"theHamsta/nvim-dap-virtual-text",
-- -- 				opts = {},
-- -- 			},
-- -- 		},
-- -- 		keys = {
-- -- 			{
-- -- 				"<leader>dB",
-- -- 				function()
-- -- 					require("dap").set_breakpoint(
-- -- 						--vim.fn.input("Breakpoint condition: ")
-- -- 					)
-- -- 				end,
-- -- 				desc = "Breakpoint Condition",
-- -- 			},
-- -- 			{
-- -- 				"<leader>dg",
-- -- 				function()
-- -- 					require("dap").toggle_breakpoint()
-- -- 				end,
-- -- 			},
-- -- 			{
-- -- 				"<leader>c",
-- -- 				function()
-- -- 					require("dap").continue()
-- -- 				end,
-- -- 			},
-- -- 			{
-- -- 				"<C-'>",
-- -- 				function()
-- -- 					require("dap").step_over()
-- -- 				end,
-- -- 			},
-- -- 			{
-- -- 				"<C-;>",
-- -- 				function()
-- -- 					require("dap").step_into()
-- -- 				end,
-- -- 			},
-- -- 			{
-- -- 				"<C-:>",
-- -- 				function()
-- -- 					require("dap").step_out()
-- -- 				end,
-- -- 			},
-- -- 		},
-- -- 		config = function()
-- -- 			-- changing the sign for breakpoints
-- -- 			-- vim.fn.sign_define("DapBreakpoint", {
-- -- 			-- 	text = "",
-- -- 			-- 	texthl = "#AF0000",
-- -- 			-- 	linehl = "",
-- -- 			-- 	numhl = "",
-- -- 			-- })
-- --
-- -- 			local js_dap = require("dap-vscode-js")
-- -- 			local dapui = require("dapui")
-- -- 			local dap = require("dap")
-- --
-- -- 			js_dap.setup({
-- -- 				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
-- -- 				adapters = {
-- -- 					"pwa-chrome",
-- -- 					"pwa-msedge",
-- -- 					"node-terminal",
-- -- 					"pwa-extensionHost",
-- -- 					"node2",
-- -- 				},
-- -- 			})
-- --
-- -- 			dapui.setup()
-- --
-- -- 			-- for _, language in ipairs({ "typescript", "javascript" }) do
-- -- 			-- 	dap.configurations[language] = {
-- -- 			-- 		{
-- -- 			-- 			type = "pwa-node",
-- -- 			-- 			request = "attach",
-- -- 			-- 			processId = require("dap.utils").pick_process,
-- -- 			-- 			name = "Attach debugger to existing `node --inspect` process",
-- -- 			-- 			sourceMaps = true,
-- -- 			-- 			resolveSourceMapLocations = {
-- -- 			-- 				"${workspaceFolder}/**",
-- -- 			-- 				"!**/node_modules/**",
-- -- 			-- 			},
-- -- 			-- 			cwd = "${workspaceFolder}/src",
-- -- 			-- 			skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
-- -- 			-- 		},
-- -- 			--
-- -- 			-- 		-- only if language is javascript, offer this debug action
-- -- 			-- 		language == "javascript"
-- -- 			-- 				and {
-- -- 			-- 					type = "pwa-node",
-- -- 			-- 					request = "launch",
-- -- 			-- 					name = "Launch file in new node process",
-- -- 			-- 					program = "${file}",
-- -- 			-- 					cwd = "${workspaceFolder}",
-- -- 			-- 				}
-- -- 			-- 			or nil,
-- -- 			-- 	}
-- -- 			-- end
-- --
-- -- 			dap.configurations = {
-- -- 				javascript = {
-- -- 					{
-- -- 						type = "node2",
-- -- 						name = "Launch",
-- -- 						request = "launch",
-- -- 						program = "${file}",
-- -- 						cwd = vim.fn.getcwd(),
-- -- 						sourceMaps = true,
-- -- 						protocol = "inspector",
-- -- 						console = "integratedTerminal",
-- -- 					},
-- -- 					{
-- -- 						type = "node2",
-- -- 						name = "Attach",
-- -- 						request = "attach",
-- -- 						program = "${file}",
-- -- 						cwd = vim.fn.getcwd(),
-- -- 						sourceMaps = true,
-- -- 						protocol = "inspector",
-- -- 						console = "integratedTerminal",
-- -- 					},
-- -- 				},
-- -- 			}
-- --
-- -- 			dap.adapters.node2 = {
-- -- 				type = "executable",
-- -- 				command = "node",
-- -- 				args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
-- -- 			}
-- --
-- -- 			-- event listeners
-- -- 			dap.listeners.after.event_initialized["dapui_config"] = function()
-- -- 				dapui.open({ reset = true })
-- -- 			end
-- -- 			dap.listeners.before.event_terminated["dapui_config"] = function()
-- -- 				dapui.close({})
-- -- 			end
-- -- 			dap.listeners.before.event_exited["dapui_config"] = function()
-- -- 				dapui.close({})
-- -- 			end
-- -- 		end,
-- -- 	},
-- -- }
