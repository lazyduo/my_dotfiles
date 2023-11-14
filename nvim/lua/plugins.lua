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
    -- fancy startup screen
    { 'mhinz/vim-startify' },
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
    },
    -- auto save
    {
        'Pocco81/auto-save.nvim',
        event = {'InsertLeave', 'TextChanged'} -- Autosave only when enter Insert mode
    },

    -- UI

    -- indent blankline
    {
        'lukas-reineke/indent-blankline.nvim',
        event = 'BufRead',
    },
    -- automatically highlighting other uses of the word under the cursor
    {
        'RRethy/vim-illuminate',
        event = 'BufRead',
    },
    -- status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('config.lualine').setup,
    },

    -- LSP Plugins

    -- LSP Zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
        -- Disable automatic setup, we are doing it manually
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
        -- Here is where you configure the autocompletion settings.
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()
    
        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()
    
        cmp.setup({
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = false}),
            
            -- Scroll up and down in the completion documentation
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),

            -- Navigate between snippet placeholder
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            })
        })
        end
    },
    -- LSP Config
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()
    
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)
    
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'lua_ls', 'pyright'},
            handlers = {
                lsp_zero.default_setup,
            },
        })
        end
    },
    -- null-ls: Formatter
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
        local null_ls = require('null-ls')
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.shfmt, -- shell script formatting
                null_ls.builtins.formatting.prettier, -- markdown formatting
                null_ls.builtins.formatting.black, -- python formatting
            },
            -- format files on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
        end
    }
}
   
