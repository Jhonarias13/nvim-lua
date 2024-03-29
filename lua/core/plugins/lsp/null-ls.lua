local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return 
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  debug = false,
    sources = {
       -- formatting.prettier.with({extra_args = {"--no-semi", "--single-quote", "--jsx-single-quote"}}),
       formatting.prettier,
       formatting.stylua,
       diagnostics.eslint_d
   }
})
