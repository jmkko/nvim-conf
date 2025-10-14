return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			-- Tous les filetypes C/C++
			c = { "clang-format" },
			cpp = { "clang-format" },
			h = { "clang-format" },
			hpp = { "clang-format" },
			cc = { "clang-format" },
			cxx = { "clang-format" },
			tpp = { "clang-format" },
		},
		formatters = {
			["clang-format"] = {
				command = "/opt/homebrew/opt/llvm/bin/clang-format",
				args = {
					"--style=file", -- Utilise le .clang-format du projet
					"--assume-filename=$FILENAME", -- Important pour la détection du langage
				},
				stdin = true,
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
