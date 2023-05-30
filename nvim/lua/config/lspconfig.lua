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

	local ext = function(table, key, value)
		local tbl = table
		tbl[key] = value
		return tbl
	end

	-- Map following using LspAttach after language servers have attached
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			local bufopts = { buffer = ev.buf }
			-- Buffer local mappings
			-- See `:h vim.lsp.*` for docs on any lsp functions
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, ext(bufopts, "desc", "Go to declaration"))
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, ext(bufopts, "desc", "Go to definition"))
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, ext(bufopts, "desc", "Go to references"))
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, ext(bufopts, "desc", "Go to implementation"))
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, ext(bufopts, "desc", "Hover description"))
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, ext(bufopts, "desc", "Signature help"))
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, ext(bufopts, "desc", "Workspace add"))
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, ext(bufopts, "desc", "Workspace remove"))
			vim.keymap.set('n', '<space>lw', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, ext(bufopts, "desc", "List workspaces"))
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, ext(bufopts, "desc", "Type definition"))
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, ext(bufopts, "desc", "Rename"))
			vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, ext(bufopts, "desc", "Code action"))
			vim.keymap.set('n', '<space>cf', function()
				vim.lsp.buf.format { async = true }
			end, ext(bufopts, "desc", "Code format"))
		end
	})
end

return M

