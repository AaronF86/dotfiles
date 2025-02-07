local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
