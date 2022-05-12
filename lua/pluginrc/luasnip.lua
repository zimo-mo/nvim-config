-- local ls = require("luasnip")
-- -- some shorthands...
-- local s = ls.snippet
-- local t = ls.text_node
-- 
-- 
-- -- autotriggered snippets have to be defined in a separate table, luasnip.autosnippets.
-- ls.autosnippets = {
-- 	all = {
-- 		s("autotrigger", {
-- 			t("autosnippet"),
-- 		}),
-- 	},
-- }
-- 
-- in a lua file: search lua-, then c-, then all-snippets.
-- ls.filetype_extend("lua", { "c" })
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
-- ls.filetype_set("cpp", { "c" })

--[[
-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.
-- Mind that this will extend  `ls.snippets` so you need to do it after your own snippets or you
-- will need to extend the table yourself instead of setting a new one.
]]

-- require("luasnip/loaders/from_vscode").load({ include = { "python" } }) -- Load only python snippets
-- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
-- a similar `package.json`)
-- require("luasnip/loaders/from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from my-snippets folder

-- You can also use lazy loading so you only get in memory snippets of languages you use
-- require("luasnip.loaders.from_vscode").load({ paths = "~/.local/share/nvim/site/pack/viplugins/start/friendly-snippets"}) -- You can pass { paths = "./my-snippets/"} as well
