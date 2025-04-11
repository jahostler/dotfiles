return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		build = (not LazyVim.is_win())
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = { vim.fn.stdpath("config") .. "/snippets/" },
					})
					require("luasnip").filetype_extend("cs", { "csharpdoc" })
				end,
			},
		},
		keys = {
			{
				"<c-k>",
				function()
					local ls = require("luasnip")
					ls.expand()
				end,
				mode = { "i" },
				desc = "Expand snippet",
			},
			{
				"<c-l>",
				function()
					local ls = require("luasnip")
					ls.jump(1)
				end,
				mode = { "i", "s" },
				desc = "Jump forward",
			},
			{
				"<c-j>",
				function()
					local ls = require("luasnip")
					ls.jump(-1)
				end,
				mode = { "i", "s" },
				desc = "Jump backward",
			},
			{
				"<c-e>",
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end,
				mode = { "i", "s" },
				desc = "Change choice",
			},
		},
		opts = function()
			LazyVim.cmp.actions.snippet_forward = function()
				if require("luasnip").jumpable(1) then
					vim.schedule(function()
						require("luasnip").jump(1)
					end)
					return true
				end
			end
			LazyVim.cmp.actions.snippet_stop = function()
				if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
					require("luasnip").unlink_current()
					return true
				end
			end
		end,
	},
}
