-- ============================================================================
-- Code Formatter (stevearc/conform.nvim)
-- ============================================================================
--
-- WHAT THIS DOES:
--   Runs code formatters (prettier, stylua, etc.) to auto-format your code.
--   Can format on save or manually with a keymap.
--
-- SUPPORTED FORMATS:
--   Web:    JavaScript, TypeScript, HTML, CSS, SCSS, JSON, YAML, Markdown
--   .NET:   C# (requires csharpier: dotnet tool install -g csharpier)
--   Lua:    Lua files
--
-- KEYMAPS:
--   <leader>f    Format current buffer
--
-- COMMANDS:
--   :ConformInfo    Show formatter status for current file
--
-- BEHAVIOR:
--   - Formats automatically on save (timeout: 500ms)
--   - Falls back to LSP formatter if no formatter configured
--
-- INSTALL FORMATTERS:
--   :MasonInstall prettier stylua
--   (or install globally via npm/dotnet)
--
-- TO DISABLE FORMAT ON SAVE:
--   Comment out the format_on_save block below
--
-- ============================================================================

local Plugin = { 'stevearc/conform.nvim' }

Plugin.event = { 'BufWritePre' }
Plugin.cmd = { 'ConformInfo' }

function Plugin.config()
    local conform = require('conform')

    conform.setup({
        formatters_by_ft = {
            -- Web / Angular
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            html = { 'prettier' },
            angular = { 'prettier' },
            css = { 'prettier' },
            scss = { 'prettier' },
            less = { 'prettier' },
            json = { 'prettier' },
            jsonc = { 'prettier' },
            yaml = { 'prettier' },
            markdown = { 'prettier' },

            -- .NET
            cs = { 'csharpier' },

            -- Lua
            lua = { 'stylua' },
        },

        -- Format on save
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },

        -- Uncomment to format on save only for specific filetypes
        -- format_on_save = function(bufnr)
        --     local ft = vim.bo[bufnr].filetype
        --     local enabled = { 'lua', 'javascript', 'typescript' }
        --     if vim.tbl_contains(enabled, ft) then
        --         return { timeout_ms = 500, lsp_fallback = true }
        --     end
        --     return false
        -- end,
    })

    -- Manual format keymap
    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
        conform.format({
            async = true,
            lsp_fallback = true,
        })
    end, { desc = 'Format buffer' })
end

return Plugin
