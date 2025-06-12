return {
  "echasnovski/mini.bufremove",
  config = function()
    vim.keymap.set("n", "<leader>bd", function()
      require("mini.bufremove").delete(0, false)
    end, { desc = "Delete buffer" })
  end,
}
