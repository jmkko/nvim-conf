-- lua/plugins/togglelsp.lua

local M = {}

-- Variable d'état
local gotopreview_enabled = true

-- Fonction toggle
function M.toggle_gotopreview()
	gotopreview_enabled = not gotopreview_enabled
	vim.diagnostic.config({
		virtual_text = gotopreview_enabled,
	})
end

-- Mappage automatique si tu veux
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

return M
