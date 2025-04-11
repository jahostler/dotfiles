return {
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- disable default signature help
			keys[#keys + 1] = { "<c-k>", false, mode = { "i", "s" } }
			keys[#keys + 1] = {
				"<leader>ch",
				function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end,
				desc = "Toggle Inlay Hints",
			}
			table.insert(opts.inlay_hints, { enabled = true })
		end,
	},
}
