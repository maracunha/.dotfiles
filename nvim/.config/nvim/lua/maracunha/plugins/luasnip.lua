-- ============================================================================
-- Snippet Engine (L3MON4D3/LuaSnip)
-- ============================================================================
--
-- WHAT THIS DOES:
--   Snippet engine that expands short triggers into code templates.
--   Supports placeholders you can tab through to fill in.
--
-- HOW TO USE:
--   1. Type snippet trigger (e.g., "ll")
--   2. Press Tab (via nvim-cmp) to expand
--   3. Use Ctrl-l / Ctrl-h to jump between placeholders
--
-- CUSTOM SNIPPETS INCLUDED:
--   ll    Console log with blue color (has placeholder for text)
--   llr   Console log - OrangeRed with (╯ ͡❛ ͜ʖ ͡❛)╯┻━┻
--   lly   Console log - Yellow with ( ˘︹˘ )
--   llo   Console log - DarkOrange with ( ˘︹˘ )
--   llb   Console log - Blue with ¯\_( ͡° ͜ʖ ͡°)_/¯
--   lld   Console log - DeepPink with ( ͡▧ - ͡▧)
--   llg   Console log - GreenYellow with ( ͡▧ ͜ʖ ͡▧)
--
-- ADDING MORE SNIPPETS:
--   Add to ls.add_snippets() below, or create files in:
--   ~/.config/nvim/snippets/ (VSCode format or Lua)
--
-- ============================================================================

local Plugin = { 'L3MON4D3/LuaSnip' }

Plugin.dependencies = {
    { 'rafamadriz/friendly-snippets' }, -- Optional: collection of snippets
}

Plugin.event = { 'InsertEnter' }
Plugin.build = 'make install_jsregexp' -- Optional: for regex transformations

function Plugin.config()
    local ls = require('luasnip')

    ls.setup({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        delete_check_events = 'TextChanged',
    })

    -- Load friendly-snippets (VSCode-style snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Load custom snippets from ~/.config/nvim/snippets/
    -- require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/snippets/' })

    -- Shorthands
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    -- Custom console.log snippets with colors
    ls.add_snippets('all', {
        s('ll', {
            t("var strToPrint = "),
            i(1, "'###########';"),
            t("console.log('%c%s', 'color: DeepSkyBlue; font-size: 18px', strToPrint);"),
        }),
        s('llr', {
            t("console.log('%c%s', 'color: OrangeRed; font-size: 18px', '(╯ ͡❛ ͜ʖ ͡❛)╯┻━┻');"),
        }),
        s('lly', {
            t("console.log('%c%s', 'color: Yellow; font-size: 18px', '( ˘︹˘ )');"),
        }),
        s('llo', {
            t("console.log('%c%s', 'color: DarkOrange; font-size: 18px', '( ˘︹˘ )');"),
        }),
        s('llb', {
            t("console.log('%c%s', 'color: DeepSkyBlue; font-size: 18px', '¯\\_( ͡° ͜ʖ ͡°)_/¯');"),
        }),
        s('lld', {
            t("console.log('%c%s', 'color: DeepPink; font-size: 18px', '( ͡▧ - ͡▧)');"),
        }),
        s('llg', {
            t("console.log('%c%s', 'color: GreenYellow; font-size: 18px', '( ͡▧ ͜ʖ ͡▧)');"),
        }),
    })
end

return Plugin
