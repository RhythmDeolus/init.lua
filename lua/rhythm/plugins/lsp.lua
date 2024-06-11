return {
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
        },
        config = function ()
            local lsp_zero = require('lsp-zero')
            local cmp = require('cmp')

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.confirm({select = false});
                });
            });

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('lspconfig').anakin_language_server.setup({ cmd = {'anakinls'}})
            require('lspconfig').tsserver.setup({})
            require('lspconfig').ccls.setup({})

            require('lspconfig').volar.setup({
                filetypes = { 'vue', 'json'},
                init_options = {
                    typescript = {
                        tsdk = '/home/rhythm/.config/nvm/versions/node/v20.10.0/lib/node_modules/typescript/lib'
                        -- Alternative location if installed as root:
                        -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
                    }
                }
            })

            -- You will likely want to reduce updatetime which affects CursorHold
            -- note: this setting is global and should be set only once
            -- vim.o.updatetime = 250
            -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            --   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            --   callback = function ()
            --     vim.diagnostic.open_float(nil, {focus=false})
            --   end
            -- })
            --


            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                -- set config to show diagnostics after column 80 inline
                -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                --     vim.lsp.diagnostic.on_publish_diagnostics, {
                --         underline = true,
                --         virtual_text = {
                --             virt_text_win_col = 80,
                --             hl_mode = 'replace',
                --         },
                --         signs = true,
                --         update_in_insert = false,
                --     }
                -- )

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
        end
    },
}
