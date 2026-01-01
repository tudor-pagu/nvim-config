return {
    "rgroli/other.nvim",
    config = function()
        require("other-nvim").setup(
            {
                mappings = {
                    "cpp",
                    {
                        pattern = "(.*)%.cpp$",
                        target = "%1.hpp",
                        context = "header"
                    },
                    {
                        pattern = "(.*)%.hpp$",
                        target = "%1.cpp",
                        context = "implementation"
                    },
                },
            }
        )
        vim.keymap.set('n', '<leader>o', '<cmd>:Other<CR>', { desc = 'Toggle .cpp/.hpp' })
    end
}
