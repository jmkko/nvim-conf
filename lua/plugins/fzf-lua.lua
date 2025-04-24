return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	--dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys={
		{
		"<leader>ff",
		function() require('fzf-lua').files() end,
		desc="Find Files in project"
		},
		{
		"<leader>fg",
		function() require('fzf-lua').live_grep() end,
		desc="Find Word in project"
		},
		{
		"<leader>fw",
		function() require('fzf-lua').grep_cword() end,
		desc="Find Current Word in project"
		},
		{
		"<leader>fk",
		function() require('fzf-lua').keymaps() end,
		desc="Find Word in project"
		},
		{
		"<leader>fb",
		function() require('fzf-lua').builtin() end,
		desc="Find Word in project"
		},
		{
		"<leader>/",
		function() require('fzf-lua').lgrep_curbuff() end,
		desc="Live Grep the current buffer"
		},
		{
		"<leader>fd",
		function() require('fzf-lua').files({cwd='~/Documents'}) end,
		desc="Find files in Documents directory"
		}
	}
}
