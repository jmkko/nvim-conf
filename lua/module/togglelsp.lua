-- lua/plugins/togglelsp.lua

local M = {}

-- Variable d'état
local diagnostics_virtual_text_enabled = true

-- Fonction toggle
function M.toggle_virtual_text()
  diagnostics_virtual_text_enabled = not diagnostics_virtual_text_enabled
  vim.diagnostic.config({
    virtual_text = diagnostics_virtual_text_enabled,
  })

  if diagnostics_virtual_text_enabled then
    vim.notify("✅ Diagnostics inline activés")
  else
    vim.notify("🚫 Diagnostics inline désactivés")
  end
end

-- Mappage automatique si tu veux
vim.keymap.set("n", "<leader>d", M.toggle_virtual_text, { desc = "Toggle LSP diagnostics inline" })

return M

