return function(use)
  use 'tpope/vim-eunuch'
  use 'tpope/vim-rsi'
  use 'tpope/vim-unimpaired'

  use 'sainnhe/gruvbox-material'

  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup({})
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly',
    config = function()
      require('nvim-tree').setup()  -- TODO pass a table to configure nvim-tree further
    end
  }

  use 'rafcamlet/nvim-luapad'

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  }

  use {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      -- todo
    end
  }

  use {
    'booperlv/nvim-gomove',
    config = function()
      require("gomove").setup {
        -- whether or not to map default key bindings, (true/false)
        map_defaults = true,
        -- whether or not to reindent lines moved vertically (true/false)
        reindent = true,
        -- whether or not to undojoin same direction moves (true/false)
        undojoin = true,
        -- whether to not to move past end column when moving blocks horizontally, (true/false)
        move_past_end_col = false,
      }
    end
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          {open = "'", close = "'"},
          {open = '"', close = '"'},
          {open = '`', close = '`'},
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'}
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }

  use {
    'romgrk/barbar.nvim',
    wants = 'nvim-web-devicons',
    config = function ()
      require('bufferline').setup {}
      for i = 1, 9 do
        vim.keymap.set(
          'n',
          ('<A-%d>'):format(i),
          ('<Cmd>BufferGoto %d<CR>'):format(i),
          { desc = ('Go to buffer %d'):format(i) }
        )
      end
    end
  }


end
