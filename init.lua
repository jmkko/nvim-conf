require("config.lazy")
require("config.keymaps")
require("config.options")
require("module.togglelsp")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.b.did_ftplugin = true -- Empêche sleuth d'agir
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})
-- Monkey patch pour corriger l'accès à winborder dans certaines versions de nui
local success, utils = pcall(require, "nui.utils")
if success and utils and utils.get_default_winborder then
  local orig = utils.get_default_winborder
  utils.get_default_winborder = function()
    local ok, result = pcall(orig)
    if not ok then
      return "single" -- fallback safe border
    end
    return result
  end
end

