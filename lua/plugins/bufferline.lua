-- return { 
--   "akinsho/bufferline.nvim",
--   version = "*",
--   dependencies = "nvim-tree/nvim-web-devicons",
--   options = function()
--     require("bufferline").setup({
--       mode = "tabs",
--       --numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
--       close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
--       right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
--       left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
--       buffer_close_icon = '󰅖',
--       modified_icon = '● ',
--       close_icon = ' ',
--       left_trunc_marker = ' ',
--       right_trunc_marker = ' ',
--     })
--   end,
-- }

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
        options = {
            mode = "tabs", -- "buffers" or set to "tabs" to only show tabpages instead
            themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            separator_style = "thin",
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    },
  },
}
