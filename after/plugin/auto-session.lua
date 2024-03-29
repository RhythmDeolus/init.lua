require('auto-session').setup {
    log_level = 'info',
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = nil
}

local function auto_save_on_switch()
	vim.api.nvim_create_autocmd({"BufEnter"}, {
	  callback = function(ev)
	      vim.cmd('SessionSave')
	  end
	})
end

require('auto-session').setup({
	post_restore_cmds = { auto_save_on_switch }
})
