-- TODO: https://github.com/RRethy/nvim-treesitter-textsubjects  也許有用 container 逐步擴充選擇
-- https://github.com/RRethy/nvim-treesitter-textsubjects   很多選擇函數
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

local status_ok, tree_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

tree_config.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        -- ["ii"] = { query = "@loop.inner"},
        -- ["ai"] = { query = "@loop.outer"}
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@function.inner'] = 'V', -- linewise
        ['@loop.outer'] = 'v', -- linewise
        ['@loop.inner'] = 'v', -- linewise
        ['@class.outer'] = 'V',
        ['@class.inner'] = 'V',
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = false,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      floating_preview_opts = {border = 'single'},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

