return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        config = function ()
            local copilot = require("copilot")
            copilot.setup({
                suggestion = {
                    auto_trigger = false,
                    accept = false
                }
            })
            local copilotchat = require("CopilotChat")
            copilotchat.setup({
                debug = false,
            })
            vim.keymap.set('i', '<Tab>', function()
                if require("copilot.suggestion").is_visible() then
                    require("copilot.suggestion").accept()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
                end
            end, { desc = "Super Tab" })
        end
    },
}
