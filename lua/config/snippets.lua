local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippet("lua", {
    s("special_text", {
        t("print('hello ')"),
    }),
})

require("luasnip.loaders.from_vscode").lazy_load()
