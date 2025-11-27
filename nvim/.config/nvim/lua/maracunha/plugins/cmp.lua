-- ============================================================================
-- Autocompletion (hrsh7th/nvim-cmp)
-- ============================================================================
--
-- WHAT THIS DOES:
--   Provides autocompletion popup as you type. Shows suggestions from
--   multiple sources: LSP, snippets, buffer words, file paths.
--
-- SOURCES (in priority order):
--   1. nvim_lsp   - Suggestions from language servers (functions, variables)
--   2. luasnip    - Snippet completions (your custom snippets)
--   3. buffer     - Words from current buffer
--   4. path       - File system paths
--
-- KEYMAPS:
--   Ctrl-Space   Trigger completion manually
--   Ctrl-n       Next item
--   Ctrl-p       Previous item
--   Enter        Confirm selection
--   Ctrl-e       Cancel/close completion
--   Ctrl-b/f     Scroll docs up/down
--   Ctrl-l       Jump to next snippet placeholder
--   Ctrl-h       Jump to previous snippet placeholder
--
-- CMDLINE COMPLETION:
--   /            Search completion (buffer words)
--   :            Command completion (paths + commands)
--
-- ============================================================================

local Plugin = { 'hrsh7th/nvim-cmp' }

Plugin.dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
}

Plugin.event = { 'InsertEnter', 'CmdlineEnter' }

function Plugin.config()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
            { name = 'path' },
        }),

        mapping = cmp.mapping.preset.insert({
            -- Scroll docs in completion popup
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),

            -- Trigger completion manually
            ['<C-Space>'] = cmp.mapping.complete(),

            -- Cancel completion
            ['<C-e>'] = cmp.mapping.abort(),

            -- Confirm selection
            ['<CR>'] = cmp.mapping.confirm({ select = true }),

            -- Navigate completion items
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),

            -- Snippet navigation
            ['<C-l>'] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),

            ['<C-h>'] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        formatting = {
            format = function(entry, vim_item)
                -- Source labels
                vim_item.menu = ({
                    nvim_lsp = '[LSP]',
                    luasnip = '[Snip]',
                    buffer = '[Buf]',
                    path = '[Path]',
                })[entry.source.name]
                return vim_item
            end,
        },
    })

    -- Cmdline setup for '/'
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
        },
    })

    -- Cmdline setup for ':'
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })
end

return Plugin
