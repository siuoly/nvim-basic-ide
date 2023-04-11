local keymap = vim.keymap.set
local opts = { silent = true ,buffer=true}
keymap("n", "<f5>" , [[<Cmd>w|exe  v:count1 . "TermExec cmd='python3 %:p'"<cr>]], opts)


-- debugger setting
keymap("n", "<f6>",[[<Cmd>TermExec direction=vertical cmd="python3 -m pdb %"<cr>]])  -- 
keymap("n", "<m-b>", [[<Cmd>exe 'TermExec cmd="b %:'..line(".") ..'"'<cr>]] )
keymap("n", "<m-n>",[[<Cmd>TermExec cmd="n"<cr>]])  -- nexline
keymap("n", "<m-s>",[[<Cmd>TermExec cmd="s"<cr>]])  -- steps
keymap("n", "<m-u>",[[<Cmd>TermExec cmd="u"<cr>]])  -- 
keymap("n", "<m-d>",[[<Cmd>TermExec cmd="d"<cr>]])  -- 
keymap("n", "<m-c>",[[<Cmd>TermExec cmd="c"<cr>]])  -- 
keymap("n", "<m-p>",[[<Cmd>TermExec cmd="<cword>"<cr>]])  -- 
keymap("n", "<m-P>",[[<Cmd>TermExec cmd="<cWORD>"<cr>]])  -- 
