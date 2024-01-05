-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herevivim
local Util = require("lazyvim.util")
local keymap = vim.keymap.set

keymap("n", "<leader>sx", require("telescope.builtin").resume, { noremap = true, silent = true, desc = "Resume" })

-- Gitsigns
-- Add toggle gitsigns blame line
if Util.has("gitsigns.nvim") then
  keymap("n", "<leader>ub", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", {
    desc = "Toggle current line blame",
  })

  --  keymap("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line{full=true}<CR>", {
  --  desc = "Toggle current line blame",
  -- })

  local function open_dashboard()
    require("mini.starter").open()
  end

  -- Dashboard
  -- Add keymap to open alpha dashboard
  keymap("n", "<leader>;", function()
    -- close all open buffers before open dashboard
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      ---@diagnostic disable-next-line: redundant-parameter
      local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
      if buftype ~= "terminal" then
        vim.api.nvim_buf_delete(bufnr, { force = true })
      end
    end

    open_dashboard()
  end, opts)
end
