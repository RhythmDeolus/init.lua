local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Packer can manage itself
     'wbthomason/packer.nvim',
     "williamboman/mason.nvim",
     {
         'nvim-telescope/telescope.nvim', tag = '0.1.5',
         dependencies = { {'nvim-lua/plenary.nvim'} }
     },
     {
         "nvim-neorg/neorg",
         build = ":Neorg sync-parsers", -- This is the important bit!
         config = function()
             require("neorg").setup {
                 --               load = {
                 --                   ["core-defaults"] = {}
                 --               }
             }
         end,
     },
     {
         "CopilotC-Nvim/CopilotChat.nvim",
         branch = "canary",
         dependencies = {
             { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
             { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
         }
     },
     { 'nvim-treesitter/nvim-treesitter', build = 'TSUpdate' },
     'theprimeagen/harpoon',
     'mbbill/undotree',
     'tpope/vim-fugitive',
     -- ('tomasiser/vim-code-dark'
     'mattn/emmet-vim',
     -- ('tanvirtin/monokai.nvim'
     "ellisonleao/gruvbox.nvim",
     { 'dasupradyumna/midnight.nvim' },
     'mfussenegger/nvim-dap',
     'mfussenegger/nvim-dap-python',
     { "mxsdev/nvim-dap-vscode-js", dependencies = {"mfussenegger/nvim-dap"} },
     { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
     {
         "microsoft/vscode-js-debug",
         opt = true,
         build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
     },
     {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
     {
         'VonHeikemen/lsp-zero.nvim',
         branch = 'v3.x',
         dependencies = {
             --- Uncomment these if you want to manage LSP servers from neovim
             {'williamboman/mason.nvim'},
             {'williamboman/mason-lspconfig.nvim'},

             -- LSP Support
             {'neovim/nvim-lspconfig'},
             -- Autocompletion
             {'hrsh7th/nvim-cmp'},
             {'hrsh7th/cmp-nvim-lsp'},
             {'L3MON4D3/LuaSnip'},
         }
     },
     {
         'mrcjkb/rustaceanvim',
         version = '^4', -- Recommended
         ft = { 'rust' },
     },
     {'numToStr/Comment.nvim'},
     {'rmagatti/auto-session'},
})

require("rhythm")
