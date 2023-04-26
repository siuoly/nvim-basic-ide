local keymap = vim.keymap.set
local opts = { silent = true ,buffer=true}
keymap("n", "<f5>" , [[<Cmd>exe  v:count1 . "TermExec cmd='lua %:p'"<cr>]], opts)
keymap("n", "<f6>" , [[<Cmd>luafile %<cr>]], {silent=false,buffer=true})
