local configs = require("nvim-treesitter.configs")

configs.setup({
	highlight = {
		enable = true,
	},

	-- esta linea es para que se habilite o deshabilite el indentado
	indent = {
		enable = false,
    disable = {'javascript', 'javascriptreact', 'typescriptreact', 'html', 'css', 'json', 'yaml', 'python', 'lua'},
},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,
})
