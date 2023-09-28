-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	auto_reload_on_write = true,
	git = {
		enable = true,
	},
	sort_by = "case_sensitive",
	view = {
		centralize_selection = true,
		cursorline = true,
		width = {},
		side = "right",
		preserve_window_proportions = false,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
		add_trailing = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "all",
		highlight_modified = "none",
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
	filters = {
		dotfiles = false,
		git_ignored = false,
	},
})

vim.keymap.set("n", "<Leader>b", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
