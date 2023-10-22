local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 15,
  open_mapping = "<f7>",
	-- -- open_mapping = [[<c-\>]],
	-- hide_numbers = false,
	-- shade_terminals = true,
	-- shading_factor = 2,
	-- start_in_insert = true,
	-- insert_mappings = true,
	-- persist_size = true,
	-- direction = "float", --"vertical", 
	-- close_on_exit = true,
	-- shell = vim.o.shell,
	-- float_opts = {
	-- 	border = "curved",
	-- },
})

local Terminal = require("toggleterm.terminal").Terminal
local ipython = Terminal:new({cmd="ipython", direction="float",hidden=true})
function _ipython_toggle()
  ipython:toggle()
end
vim.api.nvim_set_keymap("n", "<f8>", "<cmd>lua _ipython_toggle()<CR>", {noremap = true, silent = true})
local zsh = Terminal:new({ direction="float",hidden=true})
function _zsh_toggle()
  zsh:toggle()
end
vim.api.nvim_set_keymap("n", "<f9>", "<cmd>lua _zsh_toggle()<CR>", {noremap = true, silent = true})

vim.api.nvim_create_user_command("Pdb", function(opt) pdb.command(opt.args) end ,{nargs="?"})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<esc><esc>', [[<c-\><c-n><cr>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<f5>', [[<C-\><C-n>:ToggleTerm<cr>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', "<f8>", "<cmd>lua _ipython_toggle()<CR>", opts)
  vim.api.nvim_buf_set_keymap(0, 't', "<f9>", "<cmd>lua _zsh_toggle()<CR>", opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
