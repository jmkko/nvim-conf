vim.api.nvim_create_user_command("ReloadAll", function()
  local config_path = vim.fn.stdpath("config") .. "/lua/config/"

  local files = vim.fn.glob(config_path .. "*.lua", false, true)

  for _, file in ipairs(files) do
    --local fullpath = config_path .. file
    --local ok, err = pcall(dofile, fullpath)
    local ok, err = pcall(dofile, file)
    if ok then
      print("✅ Rechargé : " .. file)
    else
      print("❌ Erreur dans " .. file .. ":\n" .. err)
    end
  end
end, {})

