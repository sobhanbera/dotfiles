-- +-----------------------------------------------------+
-- |                 INITIALIZING LUASNIPS               |
-- +-----------------------------------------------------+

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
	-- This tells LuaSnip to remember to keep around the last snippet. You can jump back into it even if you move outside of the selection
	history = true,
	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

-- mappings for jumping forward and backward
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

local function get_timezone_offset()
	return os.date("%a %d %b %Y %H:%M:%S")
end

-- this is the default cpp competitive programming template
ls.add_snippets("cpp", {
	s("cpp_template", {
		t({
			"/*\\",
			"|*| @Author : sobhanbera\t",
			"|*| @At     : ",
		}),

		f(get_timezone_offset),

		t({
			"",
			"|*| @GitHub : https://github.com/sobhanbera\t",
			"\\*/\t",
			"#include <bits/stdc++.h>\t",
			"using namespace std;\t",
			"\t",
			"#define ll long long",
			"#define FOR(i, a, b) for(int i = a; i <= b; i++)",
			"#define REV(i, b, a) for(int i = b; i >= a; ++i)",
			"#define FORL(i, a, b) for(ll i = a; i <= b; i++)",
			"#define REVL(i, b, a) for(ll i = b; i >= a; --i)",
			"#ifndef ONLINE_JUDGE",
			'#include "sb/local.h"',
			"#else",
			"#define d(...) 1",
			"#endif",
			"",

			"void solution(int _time) {",
			"\t",
		}),

		i(0),

		t({
			"",
			"}",
			"",
			"int main() {",
			"\tios_base::sync_with_stdio(false);",
			"\tcin.tie(nullptr);",
			"\tint t = 1;",
			"\t",
		}),

		-- i(1, "\tcin >> t;"),
		c(1, {
			t("cin >> t;"),
			t("// cin >> t;"),
		}),

		t({
			"",
			"\tFOR(i, 1, t) {",
			'\t\t/* printf("Case #%d: ", i); */',
			"\t\tsolution(i);",
			"\t\tcout << endl;",
			"\t}",
			"\treturn 0;",
			"}",
		}),
	}),
})
