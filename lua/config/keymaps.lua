vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Diagnostic" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Code Formating" })
vim.keymap.set("n", "|", "<cmd>vsp<CR>", { desc = "Split vertical buffer" })
vim.keymap.set("n", "\\", "<cmd>sp<CR>", { desc = "Split horizontal buffer" })
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit buffer" })
vim.keymap.set("n", "<leader>l", "<cmd>ListcharsToggle<CR>", { desc = "Toggle listchars" })
