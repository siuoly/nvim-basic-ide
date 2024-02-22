---@type MappingsTable
local M = {}

local function dict_search()
  -- sdcv:dictionary command  grep:color output command
  vim.api.nvim_command([[terminal sdcv <cword>|grep --color=always -zP -e "-->.*\n"]])
  vim.cmd("tab split")
  vim.keymap.set("n","q",":bd!<cr>",{buffer=true})
end

local function dict_pronounce()
  local nvterm = require("nvterm.terminal")
  nvterm.send( "trans -sp -b ".. vim.fn.expand("<cword>"), "float")
end



M.general = {
  n = {
    ["<cr>"] = {
      function ()
        if vim.o.buftype == "nofile" or vim.o.ft =="qf" then
          return "<cr>"
        else
          return ":"
        end
      end
      , opts = { nowait = true,expr=true } },
    ["Q"] = { function () require("nvchad.tabufline").close_buffer() end, "Close buffer", opts = { nowait = true } },
    ["<home>"] = {"^"},
    ["<leader>e"] = {"<Cmd>NvimTreeToggle<cr>", "toggle nvimtree"},
    -- ["gs"] = {"<Cmd>!sdcv <cword><cr>","sdcv dictionary search keyword"}
    ["gs"] = {dict_search,"sdcv dictionary search keyword"},
    ["gS"] = {dict_pronounce,"Pronounce the word under cursor"},
    ["q"] = { [[ &bt=="nofile"||&bt=="quickfix" ? ":q<cr>":"q" ]], "<q> remap", opts={remap=false,nowait=true,expr=true}}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  c = {
    ["qq"] = {"q!<cr>", "forcely close buffer" },
    ["SS"] = {  "%s/" },
    ["GG"] = {  "%g/" },
    ["ww"] = {  "w|mkview" }
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
    ["<esc><esc>"] = {[[<C-\><C-n>]], "terminal mode to normal mode"},
    ["<C-h>"] = { "<Cmd>wincmd h<cr>","terminal mode:move left"},
    ["<C-j>"] = { "<Cmd>wincmd j<cr>","terminal mode:move down"},
    ["<C-k>"] = { "<Cmd>wincmd k<cr>","terminal mode:move up"},
    ["<C-l>"] = { "<Cmd>wincmd l<cr>","terminal mode:move right"},
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
    ["gd"] = {"<Cmd>Telescope lsp_definitions<cr>", "LSP definitions"},
    ["gD"] = {"<Cmd>tab split|Telescope lsp_definitions<cr>", "LSP definitions"}
  }
}
M.telescope = {
  n = {
    ["<C-S-O>"] = {"<cmd> Telescope oldfiles <CR>","Find oldfiles" }
  }
}

-- more keybinds!

return M
