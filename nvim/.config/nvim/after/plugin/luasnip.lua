local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

-- snippets are added via ls.add_snippets(filetype, snippets[, opts]), where
-- opts may specify the `type` of the snippets ("snippets" or "autosnippets",
-- for snippets that should expand directly after the trigger is typed).
--
-- opts can also specify a key. By passing an unique key to each add_snippets, it's possible to reload snippets by
-- re-`:luafile`ing the file in which they are defined (eg. this one).

ls.add_snippets("all", {
  s("ll", {
    t("var strToPrint = "),
    i(1, "'###########';"),
    t("console.log('%c%s', 'color: DeepSkyBlue; font-size: 18px', strToPrint);"),
    key = "js",
  }),
  s("llr", {
    t("console.log('%c%s', 'color: OrangeRed; font-size: 18px', '(╯ ͡❛ ͜ʖ ͡❛)╯┻━┻');"),
    key = "js",
  }),
  s("lly", {
    t("console.log('%c%s', 'color: Yellow; font-size: 18px', '( ˘︹˘ )');"),
    key = "js",
  }),
  s("llo", {
    t("console.log('%c%s', 'color: DarkOrange; font-size: 18px', '( ˘︹˘ )');"),
    key = "js",
  }),
  s("llb", {
    t("console.log('%c%s', 'color: DeepSkyBlue; font-size: 18px', '¯\\_( ͡° ͜ʖ ͡°)_/¯');"),
    key = "js",
  }),
  s("lld", {
    t("console.log('%c%s', 'color: DeepPink; font-size: 18px', '( ͡▧ - ͡▧)');"),
    key = "js",
  }),
  s("llg", {
    t("console.log('%c%s', 'color: GreenYellow; font-size: 18px', '( ͡▧ ͜ʖ ͡▧)');"),
    key = "js",
  }),
})
