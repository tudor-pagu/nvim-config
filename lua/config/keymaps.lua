-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function to build the current file

local print_data = function(_, data)
    print(table.concat(data, "\n"))
end

local function build_current_file(callback)
    local file_name = vim.api.nvim_buf_get_name(0)
    local extension = file_name:match("^.+%.(.+)$") or ""
    local build_command = ""
    if extension == "cpp" then
        local executable_name = file_name:gsub("." .. extension, "")
        build_command = "g++ -DLOCAL " .. file_name .. " -o " .. executable_name
    end

    if build_command ~= "" then
        vim.fn.jobstart(build_command, {
            on_exit = function(_, return_code)
                callback(return_code)
            end,
            on_stderr = print_data,
        })
    end
end

local function run_current_file()
    local file_name = vim.api.nvim_buf_get_name(0)
    local extension = file_name:match("^.+%.(.+)$") or ""
    file_name = file_name:gsub("." .. extension, "")
    vim.fn.jobstart(file_name, {
        on_stdout = print_data,
    })
end
vim.api.nvim_create_user_command("Build", function()
    build_current_file(function(return_code)
        if return_code == 0 then
            print("Built succesfully")
        end
    end)
end, {})
vim.api.nvim_create_user_command("BuildRun", function()
    build_current_file(function(return_code)
        if return_code ~= 0 then
            run_current_file()
        end
    end)
end, {})

vim.keymap.set("n", "<f3>", "<cmd>w<cr><cmd>!g++ % -o %< && %<<cr>")
vim.keymap.set("n", "<f4>", function()
    vim.api.nvim_command("w")
    vim.api.nvim_command("!g++ -g % -o %<")
    local dap = require("dap")
    dap.configurations.cpp[1].program = vim.fn.expand("%<")
    dap.continue()
end)
