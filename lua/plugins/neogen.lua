-- return {
-- 	"danymat/neogen",
-- 	dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "L3MON4D3/LuaSnip",
--   },
--   config = function()
--     require("neogen").setup {
--       enabled = true,
--       snippet_engine = "luasnip", -- ou "vsnip" / "snippy" si tu en utilises un autre
--       languages = {
--         cpp = {
--           template = {
--             annotation_convention = "doxygen", -- très important
--           }
--         }
--       }
--     }
--   end,
-- 	-- Uncomment next line if you want to follow only stable versions
-- 	-- version = "*"
-- }
--
return {
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("neogen").setup({
        enabled = true,
        snippet_engine = "luasnip",
        languages = {
          cpp = {
            template = {
              annotation_convention = "doxygen",
            },
          },
          c = {
            template = {
              annotation_convention = "doxygen", 
            },
          },
        },
      })
      
      -- Keymaps pour Neogen
      vim.keymap.set("n", "<leader>ng", function()
        require("neogen").generate()
      end, { desc = "Generate documentation comment" })
      
      vim.keymap.set("n", "<leader>nf", function()
        require("neogen").generate({ type = "func" })
      end, { desc = "Generate function documentation" })
      
      vim.keymap.set("n", "<leader>nc", function()
        require("neogen").generate({ type = "class" })
      end, { desc = "Generate class documentation" })
    end,
  }
}
