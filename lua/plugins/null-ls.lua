local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- node linters
		formatting.prettier,
		-- python linters
		formatting.isort,
		formatting.black,
		diagnostics.flake8,
		-- lua linters
		formatting.stylua,
		diagnostics.luacheck.with({
			-- luacheck options
			args = { "--globals", "vim" },
		}),
		-- rust linters
		diagnostics.ltrs,
		formatting.rustfmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					--[[ vim.lsp.buf.formatting_sync() ]]
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
