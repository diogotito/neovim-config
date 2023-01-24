local function save()
  vim.cmd [[write]]
end

-- Saner motions.
-- '' means {'n', 'v', 'o'}
vim.keymap.set('', 'gh', '^')
vim.keymap.set('', 'gl', '$')
vim.keymap.set('', 'gk', 'gg')
vim.keymap.set('', 'gj', 'G')

-- Consider max397574/better-escape.nvim
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')

-- System clipboard
vim.keymap.set('n', '<C-S-v>', '"+p`[v`]=')
vim.keymap.set('i', '<C-S-v>', '<C-r>+')
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Black hole
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({'n', 'v'}, "<leader>d", "\"_d")

-- GUI-friendly keybindings
vim.keymap.set('i', '<C-BS>', '<C-w>')
vim.keymap.set('i', '<C-z>', '<C-o>u')
vim.keymap.set('n', '<M-S-d>', '0D')
vim.keymap.set({'', 'i'}, '<C-s>', save, { desc = "[B]uffer [S]ave" })

-- Bubble lines up and down
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")

-- Create empty lines
vim.keymap.set('n', '<M-o>', 'o<Esc>k')
vim.keymap.set('n', '<M-S-o>', 'O<Esc>j<C-e>')

-- More elaborate Keybindings
vim.keymap.set("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Buffer management
vim.keymap.set('n', '<leader>bs', save, { desc = "[B]uffer [S]ave" })

vim.keymap.set('n', '<leader>br', function()
  if vim.bo.modified and vim.fn.confirm('Revert buffer?', '&Yes\n&No') == 1 then
    vim.cmd [[e!]]
  end
end, { desc = "[B]uffer [S]ave" })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-n>', function() require('nvim-tree.api').tree.toggle { focus = false, find_file = true } end, { desc = '[T]oggle [T]ree' })

vim.keymap.set('n', '<Tab>', '<C-6>')
