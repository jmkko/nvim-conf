-- return {
-- 	"saghen/blink.cmp",
-- 	-- optional: provides snippets for the snippet source
-- 	dependencies = { "rafamadriz/friendly-snippets" },
--
-- 	-- use a release tag to download pre-built binaries
-- 	version = "1.*",
-- 	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- 	-- build = 'cargo build --release',
-- 	-- If you use nix, you can build from source using latest nightly rust with:
-- 	-- build = 'nix run .#build-plugin',
--
-- 	---@module 'blink.cmp'
-- 	---@type blink.cmp.Config
-- 	opts = {
-- 		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
-- 		-- 'super-tab' for mappings similar to vscode (tab to accept)
-- 		-- 'enter' for enter to accept
-- 		-- 'none' for no mappings
-- 		--
-- 		-- All presets have the following mappings:
-- 		-- C-space: Open menu or open docs if already open
-- 		-- C-n/C-p or Up/Down: Select next/previous item
-- 		-- C-e: Hide menu
-- 		-- C-k: Toggle signature help (if signature.enabled = true)
-- 		--
-- 		-- See :h blink-cmp-config-keymap for defining your own keymap
-- 		keymap = { preset = "enter" },
--
-- 		appearance = {
-- 			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
-- 			-- Adjusts spacing to ensure icons are aligned
-- 			nerd_font_variant = "mono",
-- 		},
--
-- 		-- (Default) Only show the documentation popup when manually triggered
-- 		completion = { documentation = { auto_show = true } },
-- 		-- show where we are when typing variable in fuction
-- 		signature = { enabled = true },
-- 		-- Default list of enabled providers defined so that you can extend it
-- 		-- elsewhere in your config, without redefining it, due to `opts_extend`
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 		},
--
-- 		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
-- 		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
-- 		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
-- 		--
-- 		-- See the fuzzy documentation for more information
-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
-- 	},
-- 	opts_extend = { "sources.default" },
-- }

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ['<C-CR>'] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
