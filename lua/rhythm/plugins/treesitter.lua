return {
    { 
        'nvim-treesitter/nvim-treesitter',
        build = 'TSUpdate',
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "python", "vim", "vimdoc", "query", "cmake"},
                ignore_install = {"help"},
                sync_install = false,
                highlight = { 
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                auto_install = true,
                indent = { enable = true },  
            })
        end
    },
}
