require("andromeda").setup({
	preset = "andromeda",
	styles = {
		italic = true,
	},
})

vim.cmd([[ set background=dark]])
vim.cmd([[ colorscheme andromeda ]])
