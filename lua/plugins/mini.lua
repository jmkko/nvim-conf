return {
  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      local mini_statusline = require('mini.statusline')

      -- Fonction personnalisée pour récupérer la branche git
      local function get_git_branch()
        local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
        if handle then
          local result = handle:read("*a")
          handle:close()
          result = result:gsub("%s+", "")
          if result ~= '' then
            return ' ' .. result
          end
        end
        return ''
      end

      mini_statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 120 })
            local git = get_git_branch()
            local diagnostics = mini_statusline.section_diagnostics({})
            local filename = mini_statusline.section_filename({})
            local fileinfo = mini_statusline.section_fileinfo({ trunc_width = 75 })
            local location = mini_statusline.section_location({ trunc_width = 75 })

            return mini_statusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { location } },
            })
          end,
        },
      })
    end
  },
  {
    'echasnovski/mini.pairs',
    version = false,
    opts={}
  },
  {
    'echasnovski/mini-git',
    version = false,
    main = 'mini.git',
    config = function()
      require('mini.git').setup({
        signs = true, -- Active les signes Git dans la gutter
      })
    end
  },
}
