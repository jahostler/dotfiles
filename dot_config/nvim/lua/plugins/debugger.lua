return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				event = "BufReadPre", -- <-- this
			},
		},
		keys = {
			{ "<F5>", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = function()
				local dap = require("dap")
				local dapui = require("dapui")
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
			end,
		},
	},
}
