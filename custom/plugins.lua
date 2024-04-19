local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  --
  {
    "lambdalisue/suda.vim",
    cmd = {"SudaRead","SudaWrite"},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "rlue/vim-barbaric",
    event = "InsertEnter",
  },
  {
    "michaeljsmith/vim-indent-object",
    keys = {"vii","vai"}
  }, -- indent object
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      experimental = {
        ghost_text = true,
      },
      window = {
        completion = {
          scrollbar = true,
        },
      },
    }
  },
  {
    "junegunn/goyo.vim",
    cmd = "Goyo"
  },
  {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
    config = function()
      require('hlslens').setup{
        nearest_only = true,
      }
      local kopts = {noremap = true, silent = true}
      vim.api.nvim_set_keymap('n', 'n',
          [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap('n', 'N',
          [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      -- vim.api.nvim_set_hl( 0, "HlSearchNear",{ fg="#353b45",bg="#aabbaa"})
      -- vim.api.nvim_set_hl( 0, "HlSearchLens",{ fg="#808080",bg="#1e222a"})
      vim.api.nvim_set_hl( 0, "HlSearchLensNear",{ fg="white",bg="#1e222a"})
      vim.api.nvim_set_hl( 0, "IncSearch",{ fg="#ffffff",bg="#e69419"})
      vim.api.nvim_set_hl( 0, "Search",{ fg="#ffffff",bg="#93836c"})
    end

  }



  -- {
  --   'kevinhwang91/nvim-ufo',
  --   dependencies = 'kevinhwang91/promise-async',
  --   event="VeryLazy",
  --   opts = {
  --     filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
  --   },
  --   config = function(_, opts)
  --     vim.api.nvim_create_autocmd('FileType', {
  --       group = vim.api.nvim_create_augroup('local_detach_ufo', { clear = true }),
  --       pattern = opts.filetype_exclude,
  --       callback = function()
  --         require('ufo').detach()
  --       end,
  --     })
  --
  --     vim.opt.foldlevelstart = 99
  --     require('ufo').setup(opts)
  --   end,
		-- -- keys = {
		-- -- 	-- stylua: ignore start
		-- -- 	{ "zm", function() require("ufo").closeAllFolds() end, desc = "󱃄 Close All Folds" },
		-- -- 	{ "zr", function() require("ufo").openFoldsExceptKinds { "comment", "imports" } end, desc = "󱃄 Open All Regular Folds" },
		-- -- 	{ "zR", function() require("ufo").openFoldsExceptKinds {} end, desc = "󱃄 Open All Folds" },
		-- -- 	{ "z1", function() require("ufo").closeFoldsWith(1) end, desc = "󱃄 Close L1 Folds" },
		-- -- 	{ "z2", function() require("ufo").closeFoldsWith(2) end, desc = "󱃄 Close L2 Folds" },
		-- -- 	{ "z3", function() require("ufo").closeFoldsWith(3) end, desc = "󱃄 Close L3 Folds" },
		-- -- 	{ "z4", function() require("ufo").closeFoldsWith(4) end, desc = "󱃄 Close L4 Folds" },
		-- -- 	-- stylua: ignore end
		-- -- },
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
