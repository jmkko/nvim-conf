return {
  {
    -- Configuration pour gérer automatiquement les buffers
    "echasnovski/mini.bufremove",
    config = function()
      -- Fonction pour fermer automatiquement les buffers non utilisés
      local function close_unused_buffers()
        local current_buf = vim.api.nvim_get_current_buf()
        local buffers = vim.api.nvim_list_bufs()
        
        for _, buf in ipairs(buffers) do
          if buf ~= current_buf 
             and vim.api.nvim_buf_is_loaded(buf) 
             and vim.api.nvim_buf_get_option(buf, 'buflisted')
             and vim.api.nvim_buf_get_option(buf, 'buftype') == '' then
            -- Vérifier si le buffer n'est affiché dans aucune fenêtre
            local windows = vim.api.nvim_list_wins()
            local is_displayed = false
            for _, win in ipairs(windows) do
              if vim.api.nvim_win_get_buf(win) == buf then
                is_displayed = true
                break
              end
            end
            
            if not is_displayed then
              require("mini.bufremove").delete(buf, false)
            end
          end
        end
      end

      -- Raccourci pour fermer le buffer actuel
      vim.keymap.set("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "Delete buffer" })

      -- Raccourci pour fermer tous les buffers sauf le courant
      vim.keymap.set("n", "<leader>bo", function()
        close_unused_buffers()
      end, { desc = "Delete other buffers" })

      -- Option : Autocmd pour fermer automatiquement les buffers cachés
      -- Décommentez les lignes suivantes si vous voulez une fermeture automatique
      --[[
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          vim.defer_fn(close_unused_buffers, 100)
        end,
      })
      --]]
    end,
  }
}