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
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "cpp", "c", "lua" },
      highlight = { enable = true },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },
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
              annotation_convention = "doxygen", -- ⚡️ clé essentielle
            },
          },
          c = {
            template = {
              annotation_convention = "doxygen",
            },
          },
        },
      })

      -- Raccourci pratique pour générer la doc
      vim.keymap.set("n", "<leader>d", function()
        require("neogen").generate()
      end, { desc = "Générer un commentaire de fonction" })
    end,
  }
}
