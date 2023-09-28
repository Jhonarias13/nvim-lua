-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  git = {
    enable = true,
  },
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "right",
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<Leader>b", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
