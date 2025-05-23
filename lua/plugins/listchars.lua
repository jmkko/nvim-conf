return {
  "fraso-dev/nvim-listchars",
  event = "BufEnter",
  config = function()
    require("nvim-listchars").setup({
      save_state = false,
      listchars = {
        trail = "-",
        eol = "↲",
        tab = "» ",
        space = "·",
		nbsp = "␣",
      },
      notifications = true,
      exclude_filetypes = {
        "markdown"
      },
      lighten_step = 10,
    })
  end,
}
