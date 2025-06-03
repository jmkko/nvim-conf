return {
  "numToStr/FTerm.nvim",
  keys = {
    {
      "<leader>ft",
      "<cmd>lua require('FTerm').toggle()<CR>",
      desc = "Toggle Terminal"
    }
  },
  config = function()
    require("FTerm").setup({
      cmd = os.getenv("zsh"),
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })
  end,
}

