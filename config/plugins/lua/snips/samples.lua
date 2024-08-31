local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
-- local d = ls.dynamic_node
-- local sn = ls.snippet_node

local myfunc = function()
	return "First insert: "
end

return {
	s("hello", {
		t('print("hello '),
		i(1),
		t(' world")'),
	}),
	s("test", {
		i(1),
		t("1"),
		rep(1),
		t("2"),
		rep(1),
		t("3"),
	}),
	s(
		"choice",
		fmt([[Your choice was {}.]], {
			c(1, {
				t("yes"),
				t("no"),
			}),
		})
	),
	s("example", {
		f(myfunc),
		i(1),
		t("Second insert: "),
		i(2),
	}),
}
