require("rhythm.remap")
require("rhythm.set")

vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("restore_session", {clear = true}),
    callback = function()
        if vim.fn.argc() == 0
        then
            vim.cmd("e .")
        end
        require("persistence").load()
    end,
    nested = true
})
