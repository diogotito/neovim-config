return function(use)
  -- tpope's Vim plugins
  use 'tpope/vim-repeat'      -- Makes many actions from Vim plugins repeatable
  use 'tpope/vim-eunuch'      -- :Rename, :Mkdir, :Move, :Copy, :Delete, :W, :Wall, :SudoWrite, etc.
  use 'tpope/vim-rsi'         -- Emacs keybindings in Insert and Command mode!
  use 'tpope/vim-unimpaired'  -- Lots of keybindings under [, ] and yo

  ------------------
  -- Misc plugins --
  ------------------

  -- Cool Lua playground buffer
  use 'rafcamlet/nvim-luapad'

  -- Run lines/blocks of code!
  use 'michaelb/sniprun'

  -- Mini.nvim is a collection of plugins with a consistent configuration API
  use {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      -- todo
    end
  }

  -----------------------
  -- Text manipulation --
  -----------------------

  -- Move and duplicate with Alt+[hjkl]
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

  -- Deal with ((surroundings))
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  -- Provides functions to align stuff
  use 'Vonr/align.nvim'


  ------------------------------------------------------------------
  -- Replicate features from other modern graphical text editors  --
  ------------------------------------------------------------------

  -- Peeks lines of the buffer in non-obtrusive way while entering :{number}
  use 'nacro90/numb.nvim'

  -- "A legend for your keymaps, commands, and autocmds"
  use 'mrjones2014/legendary.nvim'

  -- Highlight all occurrences of word under cursor
  -- and jump to them with M-p and M-n
  -- TODO highlight with a subtle background instead of underline
  use 'RRethy/vim-illuminate'

  -- Automatically close brackets, braces, etc. like in modern editors
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  }

  -- Make <Tab> jump outside of closing brackets/braces/etc. like in modern editors
  -- Pairs well with nvim-autopairs above
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

  ---------------
  -- Eye candy --
  ---------------

  -- Start screen
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- Themes and icons
  use 'sainnhe/gruvbox-material'
  use 'nvim-tree/nvim-web-devicons'

  -- Improve default vim.ui interfaces
  use 'stevearc/dressing.nvim'

  -- popup with possible key bindings of the command you started typing
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup({})
    end
  }

  -- Sidebar with a file tree
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

  -- A tab line that shows buffers and tabpages
  -- Integrates with nvim-tree and provides functions to switch between the displayed tabs
  use {
    'romgrk/barbar.nvim',
    config = function()
      require('bufferline').setup()
      local nvim_tree_events = require('nvim-tree.events')
      local bufferline_api = require('bufferline.api')

      local function get_tree_size()
        return require'nvim-tree.view'.View.width
      end

      nvim_tree_events.subscribe('TreeOpen', function()
        bufferline_api.set_offset(get_tree_size())
      end)

      nvim_tree_events.subscribe('Resize', function()
        bufferline_api.set_offset(get_tree_size())
      end)

      nvim_tree_events.subscribe('TreeClose', function()
        bufferline_api.set_offset(0)
      end)

      for i = 1, 9 do
        local function ii(s) return s:format(i) end  -- Interpolate with i
        vim.keymap.set('n', ii'<M-%d>', ii'<Cmd>BufferGoto %d<CR>', { desc = ii'Go to buffer %d' })
      end
    end,
  }

end

-- vim: foldmethod=marker
