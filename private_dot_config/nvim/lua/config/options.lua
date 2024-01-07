-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.editorconfig = false

-- Enable undofile
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable swapfile
vim.opt.swapfile = false


-- Decrease update time
vim.o.updatetime = 50

-- Enable spell check by default unless in vscode
if not vim.g.vscode then
  vim.o.spell = true
end
