return {
  "numToStr/FTerm.nvim",
  opts = {
	keys ={
		  "<leader>s",
		  function() require('Fterm').toggle() end,
		  desc = "Toggle Terminal"
	},
  },
  config = function()
	require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
	})
  end,
}
