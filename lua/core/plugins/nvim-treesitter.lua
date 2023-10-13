local configs = require("nvim-treesitter.configs")

configs.setup({
	highlight = {
		enable = true,
	},
 
  auto_tag = {
    enable = true,
  },
	-- esta linea es para que se habilite o deshabilite el indentado
	indent = {
		enable = false,
    disable = {},
},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
})
