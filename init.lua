-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


-- override for annoying telescope not giving me root dir

vim.g.lazyvim_picker = "telescope"

vim.keymap.del("n", "<leader><leader>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    local path = vim.api.nvim_exec2("pwd", { output = true }).output
    print(path)
    vim.cmd(string.format("Telescope find_files cwd=%s", path))
end)

