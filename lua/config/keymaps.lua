-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function to build the current file

vim.keymap.set("n", "<f2>", function()
    vim.api.nvim_command("w")
    vim.api.nvim_command([[!g++ -DLOCAL %:p -o %:p:r]])
    print("build finished")
end)

vim.keymap.set("n", "<f3>", function()
    vim.api.nvim_command("w")
    vim.api.nvim_command([[!g++ -DLOCAL %:p -o %:p:r]])
    vim.api.nvim_command([[! %:p:r]])
end)
vim.keymap.set("n", "<f4>", function()
    vim.api.nvim_command("w")
    vim.api.nvim_command("!g++ -DLOCAL -g %:p -o %:p:r")
    local dap = require("dap")
    dap.configurations.cpp[1].program = vim.fn.expand("%:p:r")
    dap.continue()
end)

vim.keymap.set({ "n", "i" }, "<f7>", function()
    require("dap").step_into()
end)
vim.keymap.set({ "n", "i" }, "<f8>", function()
    require("dap").step_over()
end)
vim.keymap.set({ "n", "i" }, "<f9>", function()
    require("dap").continue()
end)

vim.keymap.set("n", "<c-[", "<esc>")
vim.keymap.set("i", "jk", "<esc>")
