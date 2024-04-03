
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/ <CR>");

function SwitchToTerm()
  local term_bufs = vim.fn.getbufinfo({buflisted = true})
  local curr_buf = vim.fn.bufnr('%')
  local filtered_bufs = {}
  
  for _, buf in ipairs(term_bufs) do
    if buf.name:match("^term") and buf.bufnr ~= curr_buf then
      table.insert(filtered_bufs, {nr = buf.bufnr, lu = buf.lastused})
    end
  end

  if vim.fn.bufname('%'):match("^term") then
    table.sort(filtered_bufs, function(b1, b2) return b1.lu < b2.lu end)
  else
    table.sort(filtered_bufs, function(b1, b2) return b1.lu > b2.lu end)
  end

  vim.cmd("buffer " .. filtered_bufs[1].nr)
end

vim.api.nvim_set_keymap('n', '<leader>t', ':lua SwitchToTerm()<CR>', {silent = true})

