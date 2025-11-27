-- ============================================================================
-- LSP Progress Notifications (j-hui/fidget.nvim)
-- ============================================================================
--
-- WHAT THIS DOES:
--   Shows LSP server activity in the bottom-right corner.
--   You can see when servers are loading, indexing, or analyzing.
--
-- EXAMPLES OF WHAT YOU'LL SEE:
--   lua_ls: Indexing (45%)
--   ts_ls: Loading project...
--   angularls: Analyzing components...
--   omnisharp: Loading solution...
--
-- WHY IT'S USEFUL:
--   - Know if LSP is still loading (be patient)
--   - Know if LSP is stuck (restart it)
--   - Know when LSP is ready (diagnostics available)
--
-- WITHOUT THIS:
--   No indication of LSP status - you're in the dark
--
-- ============================================================================

local Plugin = { 'j-hui/fidget.nvim' }

Plugin.event = { 'LspAttach' }

function Plugin.config()
    require('fidget').setup({
        progress = {
            display = {
                render_limit = 5,
                done_ttl = 3,
            },
        },

        notification = {
            window = {
                winblend = 0, -- No transparency, works better with dark themes
            },
        },
    })
end

return Plugin
