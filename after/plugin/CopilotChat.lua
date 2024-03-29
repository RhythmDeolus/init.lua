local copilot = require("copilot")
copilot.setup({
    suggestion = {
        auto_trigger = true,
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
