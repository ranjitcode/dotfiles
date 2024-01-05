-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.editorconfig = false

-- Enable spell check by default unless in vscode
if not vim.g.vscode then
  vim.o.spell = true
end
