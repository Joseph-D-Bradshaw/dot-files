local M = {}

local on_attach = function(client, bufnr)
	-- Set lsp omnifunc over builtin omnifunc when possible
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

function M.setup()
	local mason_lspconfig = require('mason-lspconfig')
	mason_lspconfig.setup {
		ensure_installed = {
			'lua_ls',
			'angularls',
			'cssls',
			'eslint',
			'emmet_ls',
			'html',
			'jsonls',
			'tsserver',
			'pyright',
			'bashls',
			'rust_analyzer'
		},
		automatic_installation = true
	}

    mason_lspconfig.setup_handlers({
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
				on_attach = on_attach
			}
        end,
        ["cssls"] = function ()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			require("lspconfig").cssls.setup {
				on_attach = on_attach,
				capabilities = capabilities
			}
        end
    })

	-- Map following using LspAttach after language servers have attached
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
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>lr', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', '<space>cf', function()
				vim.lsp.buf.format { async = true }
			end, opts)
		end
	})
end

return M

