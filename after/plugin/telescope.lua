require('telescope').setup({
    defaults = {
        ripgrep_arguments = {
            'rg', 
            '--hidden',
            '--noheading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'  
        },
    }
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
