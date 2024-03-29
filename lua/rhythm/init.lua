require("rhythm.remap")
require("rhythm.set")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0
		then
			vim.cmd("e .")
		end
	end,
})
