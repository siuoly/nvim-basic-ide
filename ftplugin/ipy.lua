local keymap = vim.keymap.set
local opts = { silent = true ,buffer=true}
keymap( 'x',"<space><space>" ,[[y<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] ,opts)
keymap( 'n',"<space><space>" ,[[m'vipy`'<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]],opts )
keymap( 'n',"<space>i",[[m'[mv][y`'<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]],{silent=true,buffer=true,remap=true} )
keymap( 'n',"<space>v",[[m'gvy`'<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] ,opts)
keymap( 'n',"<space>p",[[m'vipy`'<Cmd>TermExec cmd="\%paste -q" direction=vertical<cr>]] ,opts)

-- m' : mark ,  `' : jump back mark

keymap("n", "<f4>" , [[<Cmd>w|exe  v:count1 . "TermExec cmd='echo 'direction=vertical"<cr>]], opts)

print("ipy")

