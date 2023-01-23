--
-- Options
--

vim.opt.smartindent = true

--
-- Keybindings
--


-- Consider max397574/better-escape.nvim
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set("x", "<leader>p", "\"_dP")

-- Bubble lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")

-- More elaborate Keybindings
vim.keymap.set("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
