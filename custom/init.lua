local autocmd = vim.api.nvim_create_autocmd
vim.g.python3_host_prog = "/home/siuoly/.pyenv/versions/default/bin/python"
vim.o.wrap = false
vim.o.pumheight = 10
vim.o.scrolloff = 7
vim.api.nvim_set_hl( 0, "CurSearch",{ fg="#353b45",bg="#b2800b"})
-- require("custom.handler").setup()  -- lsp-keymap, diagnostic-symbol, 

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- custom command
vim.api.nvim_create_user_command("Fold", "set foldmethod=indent foldlevelstart=1 foldnestmax=3", {})

-- custom autocmd
autocmd("BufReadPost", { pattern = "*", command = "silent! loadview", })
autocmd("TermOpen", {pattern="*", command="set nonumber"})
autocmd(
  "BufWritePost",
  {
    pattern="*",
    callback = function ()
      -- local path = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(0)),":p")
      local path = vim.fn.expand("%:p")
      path = vim.o.viewdir .. path:gsub(vim.env.HOME,"~"):gsub("/","=+").."="
      if vim.fn.filereadable(path)==1 then
        vim.cmd.mkview()
      end
    end,
    desc = "if current file has its view file, call :mkview automatically when save file"
  }
)
