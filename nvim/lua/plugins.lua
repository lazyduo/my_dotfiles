return {
    -- the colorscheme should be available when starting Neovim
    {
      "folke/tokyonight.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
      end,
    },
    -- tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('config.tree').setup,
      },
    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
          dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim', -- improve sorting performance
        }
    }
}