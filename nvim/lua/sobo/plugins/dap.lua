return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"rcarriga/nvim-dap-ui",
		"mxsdev/nvim-dap-vscode-js",
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
		},
	},
	keys = {},
	config = function()
		-- require("dap-vscode-js")
	end,
}
