return {
    setup = function()
      require('nvim-tree').setup {
        -- sort_by = "case_sensitive",
        -- filters = {
        --   dotfiles = true,
        -- },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        git = {
          ignore = false,
        }
      }
    end,
  }