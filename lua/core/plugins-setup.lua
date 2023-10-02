local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- insert packer plugins between this lines

	-- Themes
	use("folke/tokyonight.nvim")
	use("oxfist/night-owl.nvim")
	use({
		"uloco/bluloco.nvim",
		requires = { "rktjmp/lush.nvim" },
	})
	use({
		"nobbmaestro/nvim-andromeda",
		requires = { "tjdevries/colorbuddy.nvim", branch = "dev" },
	})
	use({ "projekt0n/github-nvim-theme" })

	-- bracketpairs
	-- use("fedepujol/bracketpair.nvim")
	-- add auto commentary
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- add github copilot

	use("github/copilot.vim")

	-- nvim tree for sidebar & telescope
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-treesitter/nvim-treesitter")

	-- completions
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")

	-- formatter
	use("jose-elias-alvarez/null-ls.nvim")

	-- lsp -> language server protocols
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"glepnir/lspsaga.nvim",
		branch = "main", -- for window like vscode
		"jose-elias-alvarez/typescript.nvim",
		"onsails/lspkind.nvim",
	})

	-- telescope, fuzzy search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- lualine theme
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- autopairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- vim.opt.foldmethod     = 'expr'
	-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
	---WORKAROUND
	vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
		group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
		callback = function()
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	})
	---ENDWORKAROUND

	-- tmx navigator
	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			-- setting keys to moving between windows
			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	})

	-- end if plugins section
	if packer_bootstrap then
		require("packer").sync()
	end
end)
