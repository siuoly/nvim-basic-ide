local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- fail solution:  comment this file, 
-- manually call 
--      :luafile telescope.load_extension('luasnip')

-- luasnip

telescope.load_extension('luasnip')
vim.keymap.set('n', '<leader>ss', require'telescope'.extensions.luasnip.luasnip, { desc = '[S]earch [S]nip' })
