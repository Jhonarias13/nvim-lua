vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldmethod = 'indent' -- Establece el método de plegado a indent

-- This keybinding uses jk as the scape key to exit a mode
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })

-- This keymap clears search
vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>")

-- This keymap equivalent to  ctrl + z
vim.keymap.set("n", "<Leader>z", ":ea<CR>")

-- This keymap set up space + w to save and space + q to quit
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })

-- this keymap set up space + f to format document
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- This keymap open terminal on the top
vim.keymap.set("n", "<Leader>tv", ":botright vnew <Bar> :terminal<CR>")
-- This keymap open terminal on the bottom
vim.keymap.set("n", "<Leader>th", ":botright new <Bar> :terminal<CR>")
