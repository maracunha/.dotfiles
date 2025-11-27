-- ============================================================================
-- GitHub Copilot (github/copilot.vim)
-- ============================================================================
--
-- WHAT THIS DOES:
--   AI-powered code suggestions as you type.
--   Copilot analyzes your code and suggests completions.
--
-- SETUP:
--   Run :Copilot setup (or :Copilot auth) to authenticate with GitHub
--
-- KEYMAPS:
--   Tab       Accept suggestion
--   Ctrl-j    Next suggestion
--   Ctrl-k    Previous suggestion
--   Ctrl-]    Dismiss suggestion
--
-- COMMANDS:
--   :Copilot status    Check if Copilot is running
--   :Copilot enable    Enable Copilot
--   :Copilot disable   Disable Copilot
--   :Copilot panel     Open suggestions panel
--
-- NOTE:
--   Requires GitHub Copilot subscription
--   Suggestions appear as ghost text (grayed out)
--
-- ============================================================================

local Plugin = { 'github/copilot.vim' }

Plugin.event = { 'InsertEnter' }
Plugin.cmd = { 'Copilot' }

function Plugin.config()
    -- Accept suggestion with Tab
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<Tab>', [[copilot#Accept("\<Tab>")]], {
        expr = true,
        replace_keycodes = false,
        silent = true,
    })

    -- Navigate suggestions
    vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)', { silent = true })
    vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)', { silent = true })

    -- Dismiss suggestion
    vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)', { silent = true })

    -- Disable for certain filetypes (optional)
    vim.g.copilot_filetypes = {
        ['*'] = true,
        ['markdown'] = false,
        ['text'] = false,
    }
end

return Plugin
