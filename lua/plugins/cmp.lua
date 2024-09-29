return {
    "nvim-cmp",
    opts = function(_, opts)
        table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
        vim.o.completeopt = "menuone,noselect,preview"
        opts.preselect = require("cmp").PreselectMode.None
        opts.mapping = {
            ["<CR>"] = require("cmp").mapping.disable,
            ["<Tab>"] = require("cmp").mapping.confirm(),
        }
        return opts
    end,
}
