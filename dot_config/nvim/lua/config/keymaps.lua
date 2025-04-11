local map = vim.keymap.set
map("n", "<leader>-p", '"+p', { desc = "Paste from clipboard buffer" })
map("n", "<leader>-y", '"+y', { desc = "Yank to clipboard buffer" })

-- plugin conflicts, there's probably a better way to handle this...
vim.keymap.del("i", "<c-j>")
vim.keymap.del("i", "<c-k>")
--vim.keymap.del("s", "<c-k>")
vim.keymap.del("i", "<c-l>")
vim.keymap.del("s", "<c-l>")
vim.keymap.del("i", "<c-e>")
vim.keymap.del("s", "<c-e>")
