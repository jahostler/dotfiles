-- Roslyn - Diagnostic Refresh
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = "*",
	callback = function()
		local clients = vim.lsp.get_clients({ name = "roslyn" })
		if not clients or #clients == 0 then
			return
		end

		local buffers = vim.lsp.get_buffers_by_client_id(clients[1].id)
		for _, buf in ipairs(buffers) do
			vim.lsp.util._refresh("textDocument/diagnostic", { bufnr = buf })
		end
	end,
})

-- Refresh CodeLens
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		vim.lsp.codelens.refresh({ bufnr = bufnr })
	end,
})

-- VS auto insert
vim.api.nvim_create_autocmd("InsertCharPre", {
	pattern = "*.cs",
	callback = function()
		local char = vim.v.char

		if char ~= "/" then
			return
		end

		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
		row, col = row - 1, col + 1
		local bufnr = vim.api.nvim_get_current_buf()
		local uri = vim.uri_from_bufnr(bufnr)

		local params = {
			_vs_textDocument = { uri = uri },
			_vs_position = { line = row, character = col },
			_vs_ch = char,
			_vs_options = { tabSize = 4, insertSpaces = true },
		}

		-- NOTE: we should send textDocument/_vs_onAutoInsert request only after buffer has changed.
		vim.defer_fn(function()
			vim.lsp.buf_request(bufnr, "textDocument/_vs_onAutoInsert", params)
		end, 1)
	end,
})
