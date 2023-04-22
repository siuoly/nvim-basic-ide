local keymap = vim.keymap.set
local opts = { silent = true ,buffer=true}
keymap( 'x',"<space><space>" ,[[y<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] )
keymap( 'n',"<space>f",[[[m][y<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] )
keymap( 'n',"<space>v",[[gvy<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] )
keymap( 'n',"<space>p",[[vipy<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] )

print("ipy")

