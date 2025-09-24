-- lua/module/toggle-clangtidy.lua

local M = {}

-- Variable d'état pour clang-tidy
local clang_tidy_enabled = true

-- Configuration clangd avec clang-tidy
local function get_clangd_config_with_tidy()
  return {
    "clangd",
    "--header-insertion=never",
    "--query-driver=/usr/bin/clang++",
    "--compile-commands-dir=build",
    "--background-index",
    "--pch-storage=memory",
    "--log=error",
    "--all-scopes-completion",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--fallback-style=none",
    "--header-insertion-decorators=false",
  }
end

-- Configuration clangd sans clang-tidy
local function get_clangd_config_without_tidy()
  return {
    "clangd",
    "--header-insertion=never",
    "--query-driver=/usr/bin/clang++",
    "--compile-commands-dir=build",
    "--background-index",
    "--pch-storage=memory",
    "--log=error",
    "--all-scopes-completion",
    "--suggest-missing-includes",
    "--fallback-style=none",
    "--header-insertion-decorators=false",
  }
end

-- Fonction pour redémarrer clangd avec la nouvelle configuration
local function restart_clangd()
  -- Arrêter tous les clients clangd
  local clients = vim.lsp.get_clients({ name = "clangd" })
  for _, client in pairs(clients) do
    client.stop()
  end
  
  -- Attendre un peu pour que le serveur s'arrête complètement
  vim.defer_fn(function()
    -- Mettre à jour la configuration
    local cmd = clang_tidy_enabled and get_clangd_config_with_tidy() or get_clangd_config_without_tidy()
    
    -- Reconfigurer clangd avec la nouvelle commande
    vim.lsp.config.clangd = vim.tbl_deep_extend("force", vim.lsp.config.clangd or {}, {
      cmd = cmd,
    })
    
    -- Redémarrer pour les buffers C/C++ ouverts
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
        if ft == "c" or ft == "cpp" or ft == "h" or ft == "hpp" then
          -- Attacher le LSP au buffer
          vim.api.nvim_exec_autocmds("FileType", { buffer = buf })
        end
      end
    end
  end, 100)
end

-- Fonction toggle principal
function M.toggle_clang_tidy()
  clang_tidy_enabled = not clang_tidy_enabled
  
  local status_icon = clang_tidy_enabled and "🔧" or "🚫"
  local status_text = clang_tidy_enabled and "activé" or "désactivé"
  local log_level = clang_tidy_enabled and vim.log.levels.INFO or vim.log.levels.WARN
  
  vim.notify(string.format("%s Clang-tidy %s", status_icon, status_text), log_level)
  
  -- Redémarrer clangd avec la nouvelle configuration
  restart_clangd()
end

-- Fonction pour obtenir le statut actuel
function M.get_status()
  return clang_tidy_enabled
end

-- Fonction pour afficher le statut actuel
function M.show_status()
  local status_icon = clang_tidy_enabled and "🔧" or "🚫"
  local status_text = clang_tidy_enabled and "activé" or "désactivé"
  vim.notify(string.format("%s Clang-tidy est actuellement %s", status_icon, status_text))
end

-- Mappages des raccourcis clavier
vim.keymap.set("n", "<leader>ct", M.toggle_clang_tidy, { 
  desc = "Toggle Clang-tidy",
  silent = true 
})

vim.keymap.set("n", "<leader>cs", M.show_status, { 
  desc = "Show Clang-tidy status",
  silent = true 
})

return M