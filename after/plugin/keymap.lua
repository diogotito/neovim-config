--
-- Lua functions
--
local function desc(str)
  return { desc = str }
end

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
vim.keymap.set('n', '<M-v>', '"+p`[v`]=')
vim.keymap.set('n', '<C-S-v>', '"+p`[v`]=')
vim.keymap.set('i', '<C-S-v>', '<C-r>+')
vim.keymap.set('i', '<S-Insert>', '<C-r>+')
vim.keymap.set('i', '<M-v>', '<C-r>+')
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
local substitute_cmd = [[s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left><Space><BS>]]
local opts = { desc = '[s]ub[s]titute all occurrences of word under cursor' }
vim.keymap.set("n", "<leader>ss", ':%' .. substitute_cmd, opts)
vim.keymap.set("v", "<leader>ss", ':' .. substitute_cmd, opts)

--
-- Buffer management
--
local function nmap(lhs, desc, rhs)
  local t = type(rhs)
  if t == "string" or t == "function" then
    vim.keymap.set('n', lhs, rhs, { desc = desc })
  elseif t == "table" then
    local function run_all()
      for _, command in ipairs(rhs) do
        vim.cmd(command)
      end
    end
    vim.keymap.set('n', lhs, run_all, { desc = desc })
  end
end

nmap('<leader>bs', '[B]uffer [S]ource', {'write', 'source', 'PackerCompile'})

vim.keymap.set('n', '<leader>br', '<Cmd>:e!<CR>', { desc = "[B]uffer [S]ave" })

vim.keymap.set('n', '<C-F4>', [[<Cmd>BufferClose<CR>]], { desc = '[B]uffer [C]lose'})
vim.keymap.set('n', '<leader>bc', [[<Cmd>BufferClose<CR>]], { desc = '[B]uffer [C]lose'})
vim.keymap.set('n', '<leader>bd', [[<Cmd>BufferDelete<CR>]], { desc = '[B]uffer [D]elete'})
vim.keymap.set('n', '<leader>bw', [[<Cmd>BufferWipeout<CR>]], { desc = '[B]uffer [W]ipeout'})

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-n>', function() require('nvim-tree.api').tree.toggle { focus = false, find_file = true } end, { desc = '[T]oggle [T]ree' })

vim.keymap.set('n', '<Tab>', '<C-6>')


--
-- Git
--
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, desc '[G]it [B]lame')
