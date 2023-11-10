local map = vim.keymap.set

-- Tree
map('n', '<leader>n', function() require('nvim-tree.api').tree.toggle() end)

-- Telescope
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end) -- ripgrep is required
map('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
map('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)