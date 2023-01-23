return function(use)
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup({})
    end
  }

  use 'rafcamlet/nvim-luapad'

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }

end
