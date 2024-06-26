local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
  defaults={
    layout_strategy = 'horizontal',
    layout_config = { height = 0.95 },
  },
}

-- local actions = require "telescope.actions"
--
-- telescope.setup {
--   defaults = {
--
--     prompt_prefix = " ",
--     selection_caret = " ",
--     path_display = { "smart" },
--     file_ignore_patterns = { ".git/", "node_modules" },
--     },
--   },
-- }

vim.keymap.set("n", "<leader>sp", ":Telescope projects<CR>",{ desc = '[S]earch [P]rojects' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp_Tags' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').lsp_document_symbols, { desc = '[S]earch [D]ocument symbols' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('c', '<c-r>', "Telescope command_history<cr>", { desc = 'command history like fzf' })
vim.keymap.set('c', '<c-q>', "<c-r>", { desc = 'command history like fzf' })

vim.keymap.set('n', '<leader>?', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

