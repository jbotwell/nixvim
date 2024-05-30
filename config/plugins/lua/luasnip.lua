local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

ls.add_snippets("nix", {
  s("hello", {
    t('print("hello '),
    i(1),
    t(' world")')
  })
})

ls.add_snippets("nix", {
  s("test", {
    t('testing '),
    i(1), rep(1),
    t('repeats')
  })
})

ls.add_snippets("nix", {
  s("choice", fmt(
    [[Your choice was {}.]],
    {
      c(1, {
        t("yes"),
        t("no")
      })
    }
  ))
})

local myfunc = function()
  return "HELLO!"
end

ls.add_snippets("nix", {
  s("example", {
    f(myfunc),
    i(1),
    i(2)
  })
})
