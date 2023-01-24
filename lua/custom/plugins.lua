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

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

end
