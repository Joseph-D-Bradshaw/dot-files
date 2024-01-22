local lspzero = require('lsp-zero')

lspzero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lspzero.default_keymaps({ buffer = bufnr })
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'cssls',
        'eslint',
        'emmet_ls',
        'html',
        'jsonls',
        'tsserver',
        'bashls'
    },
    handlers = {
        lspzero.default_setup,
        lua_ls = function ()
            local lua_opts = lspzero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end
    }
})

-- Autocompletion
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Enter to confirm completion
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true  -- true to select whatever is currently hovered
        }),

        -- Ctrl + . to trigger completion menu
        ['<C-.>'] = cmp.mapping.complete(),

        -- Navigation between snippet placeholder
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- Scroll up and down in the completion documentation
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
    }),
    s
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' }
    })
})

-- Configure LSP specific keys when LSP client attaches to LSP server
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings
        -- See `:h vim.lsp.*` for docs on any lsp functions
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- Add workspace folder
        vim.keymap.set('n',
            '<leader>wa',
            vim.lsp.buf.add_workspace_folder,
            { unpack(opts), desc = 'Add workspace folder' })
        -- Remove workspace folder
        vim.keymap.set('n', '<leader>wr',
            vim.lsp.buf.remove_workspace_folder,
            { unpack(opts), desc = 'Remove workspace folder' })
        -- List workspace folders
        vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            { unpack(opts), desc = 'List workspace folders' })
        -- Type Def
        vim.keymap.set('n',
            '<leader>D',
            vim.lsp.buf.type_definition,
            { unpack(opts), desc = 'Type Definition' })
        -- Rename
        vim.keymap.set('n',
            '<leader>rn',
            vim.lsp.buf.rename,
            { unpack(opts), desc = 'Rename (in buffer)' })
        -- Code Action
        vim.keymap.set({ 'n', 'v' },
            '<leader>ca',
            vim.lsp.buf.code_action,
            { unpack(opts), desc = 'Code action' })
        -- Format (using lsp)
        vim.keymap.set({ 'n', 'v' },
            '<leader>cf',
            function()
                vim.lsp.buf.format { async = true }
            end,
            { unpack(opts), desc = 'Format' })
    end
})
