-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function to build the current file

vim.keymap.set("n", "<f3>", "<cmd>w<cr><cmd>!g++ % -o %< && %<<cr>")
vim.keymap.set("n", "<f4>", function()
    vim.api.nvim_command("w")
    vim.api.nvim_command("!g++ -g % -o %<")
    local dap = require("dap")
    dap.configurations.cpp[1].program = vim.fn.expand("%<")
    dap.continue()
end)
