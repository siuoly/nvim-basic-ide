---@type MappingsTable
local M = {}



M.general = {
  n = {
    ["<cr>"] = { [[ &ft=="qf" ? "<cr>" : ":"]], "enter command mode", opts = { nowait = true,expr=true } },
    ["Q"] = { function () require("nvchad.tabufline").close_buffer() end, "Close buffer", opts = { nowait = true } },
    ["<home>"] = {"^"},
    ["<leader>e"] = {"<Cmd>NvimTreeToggle<cr>", "toggle nvimtree"}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  c = {
    ["qq"] = {"q!<cr>", "forcely close buffer" },
    ["SS"] = {  "%s/" },
    ["GG"] = {  "%g/" }
  },
  i = {
    ["kj"] = {"<esc>", "exit"},
  }
}

M.disabled = {
  t = { -- terminal
    ["<A-i>"] = "", --Terminal
    ["<A-h>"] = "", --Terminal
    ["<A-v>"] = "", --Terminal
  },
  n = {
    ["<C-n>"] ="",
    ["<A-i>"] = "", --Terminal
    ["<A-h>"] = "", --Terminal
    ["<A-v>"] = "", --Terminal
    ["<c-n>"] = "", -- NvimTree
  }
}

M.nvterm = {
  plugin = true,
  t = {
    -- toggle in terminal mode
    ["<F7>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<F8>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<F9>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<F7>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<F8>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<F9>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.lsp = {
  n = {
    ["gr"] = {"<Cmd>Telescope lsp_references<cr>", "LSP refreence"},
    ["gd"] = {"<Cmd>Telescope lsp_definitions<cr>", "LSP definitions"}
  }
}

-- more keybinds!

return M
