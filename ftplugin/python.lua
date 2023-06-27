local keymap = vim.keymap.set
local opts = { silent = true ,buffer=true}
keymap("n", "<f5>" , [[<Cmd>w|exe  v:count1 . "TermExec cmd='python3 %:p'"<cr>]], {buffer=true})


------------- Ipython Setting --------------------------------------------
ipython = {}


ipython.run = function()
  vim.cmd([[ 
  call feedkeys("\<c-w>\<c-w>\<c-\>\<c-n>",'n')  
  call feedkeys("\"\"pi\<cr>\<cr>",'n')          
  call feedkeys("\<c-\>\<c-n>\<c-w>\<c-p>",'n')  
  ]])
-- go to terminal window" paste register" , key enter go back"
end
ipython.copy_run = function(copy)
  vim.api.nvim_command("normal m'")
  vim.api.nvim_command("normal "..copy)
  vim.api.nvim_command("normal `'")
  ipython.run()
end
ipython.send = function(cmd)
    local command = "TermExec cmd=" .. '"' .. cmd .. '"'
    vim.api.nvim_command( command )
end
ipython.run_file = function() ipython.send("\\%run %") end
ipython.run_class = function() ipython.copy_run("yac") end
ipython.run_function = function() ipython.copy_run("yaf") end
ipython.run_block = function() ipython.copy_run("yip") end
ipython.run_line = function() ipython.copy_run("yy") end
ipython.run_word = function() ipython.send("<cword>") end
ipython.run_WORD = function() ipython.send("<cWORD>") end
ipython.run_select = function() ipython.copy_run("y") end
keymap( "n", "<space>r", ipython.run_file,{} )
keymap( "n", "<space>c", ipython.run_class,{} )
keymap( "n", "<space>f", ipython.run_function,{} )
keymap( "n", "<space><space>", ipython.run_block,{} )
keymap( "x", "<space><space>", ipython.run_select,{} )
keymap( "n", "<space>q", ipython.run_line,{} )


vim.api.nvim_create_user_command("Ipy", "TermExec cmd='ipython' direction=vertical" ,{})
ipython.clear= function() ipython.send("clear") end
ipython.exit= function() ipython.send("exit") end

------------- debugger setting -------------------------------------------
pdb={}
pdb.file_point = function()
  local line=vim.api.nvim_win_get_cursor(0)[1]
  local file =vim.api.nvim_buf_get_name(0)
  return file..":"..line
end

pdb.send = function(cmd)
  local command = "TermExec cmd=" .. '"' .. cmd .. '"'
  vim.api.nvim_command( command )
end

pdb.command= function(cmd)
  if cmd == "" then
    local file = vim.api.nvim_buf_get_name(0)
    local run = "python3 -m pdb " .. file
    local command = "TermExec cmd=" .. '"' .. run .. '"' .. ' direction=vertical'
    vim.api.nvim_command( command )
  else
    pdb.send(cmd)
  end
end
-- ipython --pdb srcipy.py automaticall stop at error position
vim.api.nvim_create_user_command("Pdb", function(opt) pdb.command(opt.args) end ,{nargs="?"})

pdb.n = function() pdb.send("n") end
pdb.s = function() pdb.send("s") end
pdb.c = function() pdb.send("c") end
pdb.run = function() pdb.send("run") end
pdb.unt = function() pdb.send("unt") end
pdb.l = function() pdb.send("l .") end
pdb.ll = function() pdb.send("ll") end
pdb.u = function() pdb.send("u") end
pdb.d = function() pdb.send("d") end
pdb.b = function() pdb.send("b") end
pdb.b_line = function() pdb.send("b " .. pdb.file_point()) end
pdb.c_line = function() pdb.send("c " .. pdb.file_point()) end
pdb.j = function() pdb.send("j") end
pdb.j_line = function() pdb.send("j " .. vim.api.nvim_win_get_cursor(0)[1]) end
pdb.sticky = function() pdb.send("sticky") end
pdb.exit = function() pdb.send("exit") end
pdb.restart = function() pdb.send("exit") end
pdb.word = function() pdb.send("<cword>") end
pdb.WORD = function() pdb.send("<cWORD>") end


keymap("n", "<a-b>",pdb.b_line,{})
keymap("n", "<a-u>",pdb.u ,{})
keymap("n", "<a-i>",pdb.d ,{})

keymap("n", "<a-h>",pdb.c_line ,{})
keymap("n", "<a-j>",pdb.n ,{})
keymap("n", "<a-k>",pdb.j_line ,{})
keymap("n", "<a-n>",pdb.s ,{})

keymap("n", "<a-l>",pdb.l ,{})
keymap("n", "<a-;>",pdb.ll ,{})
keymap("n", "<a-d>",pdb.exit ,{})
keymap("n", "<a-s>",pdb.sticky ,{})
keymap("n", "<a-r>",pdb.restart ,{})
keymap("n", "<space>w",pdb.word ,{})
keymap("n", "<space>W",pdb.WORD ,{})

