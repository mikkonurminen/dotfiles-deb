-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup END
]])

local packer = require("packer")

packer.init({
  display = {
    open_fn = require("packer.util").float,
  },
})

packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Required plugi
  use({ "nvim-lua/plenary.nvim" })

  --use {
  --  "ellisonleao/gruvbox.nvim",
  -- config = function()
  --   require("plugins.gruvbox")
  -- end,
  --}

  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("plugins.rose-pine")
    end,
  })

  use({ "nvim-tree/nvim-web-devicons" })

  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  })

  -- nvim-bufferline

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "CursorHold",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("plugins.treesitter")
    end,
  })

  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- vim-surround
  use({
    "tpope/vim-surround",
    event = "BufRead",
    requires = {
      {
        "tpope/vim-repeat",
        event = "BufRead",
      },
    },
  })

  -- Comment.nvim
  use({
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("plugins.comment")
    end,
  })

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    --event = "CursorHold",
    tag = "0.1.1",
    config = function()
      require("plugins.telescope")
    end,
  })

  -- nvim-tree
  use({
    "nvim-tree/nvim-tree.lua",
    event = "CursorHold",
    config = function()
      require("plugins.nvim-tree")
    end,
  })

  -- vim-easymotion

  -- vim-illuminate

  -- mason.nvim
  use({
    "williamboman/mason.nvim",
    --event = "BufRead",
    run = ":MasonUpdate",
    config = function()
      require("plugins.lsp.mason")
    end,
    wants = "mason-lspconfig.nvim",
  })

  use({ "williamboman/mason-lspconfig.nvim" })

  use({ "jayp0521/mason-null-ls.nvim" })

  -- nvim-lspconfig
  use({
    "neovim/nvim-lspconfig",
    --event = "BufRead",
    config = function()
      require("plugins.lsp.lspconfig")
    end,
    wants = "telescope.nvim",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
    },
  })

  -- Formatting and linting
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls")
    end,
  })

  -- Completions
  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.lsp.nvim-cmp")
    end,
    requires = {
      {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
          require("plugins.lsp.luasnip")
        end,
        requires = {
          {
            "rafamadriz/friendly-snippets",
            event = "CursorHold",
          },
        },
      },
    },
  })
  --use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })

  use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

  -- nvim-autopairs
  use({
    "windwp/nvim-autopairs",
    event = "InsertCharPre",
    after = "nvim-cmp",
    config = function()
      require("plugins.autopairs")
    end,
  })

  -- which key
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
  })
end)
