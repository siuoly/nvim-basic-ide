local keymap = vim.keymap.set
local opts = { silent = true ,buffer=true}
keymap("n", "<f5>" , [[<Cmd>w|exe  v:count1 . "TermExec cmd='python3 %:p'"<cr>]], opts)
