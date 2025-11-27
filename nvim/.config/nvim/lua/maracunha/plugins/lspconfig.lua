-- ============================================================================
-- LSP Configuration (neovim/nvim-lspconfig)
-- ============================================================================
--
-- WHAT THIS DOES:
--   Provides Language Server Protocol (LSP) support for Neovim.
--   LSP gives you IDE features like: autocompletion, go-to-definition,
--   find references, rename, diagnostics (errors/warnings), and more.
--
-- HOW IT WORKS:
--   1. Mason installs LSP servers (language-specific)
--   2. mason-lspconfig bridges Mason and lspconfig
--   3. This file enables all installed servers with vim.lsp.enable()
--   4. Server-specific configs are auto-loaded from ~/.config/nvim/lsp/
--
-- DEPENDENCIES:
--   - mason.nvim: Package manager for LSP servers, formatters, linters
--   - mason-lspconfig.nvim: Connects Mason with lspconfig
--   - cmp-nvim-lsp: Adds LSP completions to nvim-cmp
--
-- KEYMAPS (set on LspAttach):
--   gd        Go to definition
--   grt       Go to type definition
--   grd       Go to declaration
--   gq        Format buffer (normal & visual mode)
--   K         Hover documentation
--   Ctrl-s    Signature help (insert mode)
--
-- NEOVIM 0.11 DEFAULT KEYMAPS (built-in):
--   grn       Rename symbol
--   grr       Find references
--   gri       Go to implementation
--   gra       Code actions
--
-- COMMANDS:
--   :Mason           Open Mason UI to install/manage servers
--   :LspInfo         Show active LSP clients
--   :LspRestart      Restart LSP servers
--   :checkhealth lsp Check LSP status
--
-- TO ADD A NEW LANGUAGE:
--   1. Run :Mason and install the server (e.g., angularls, omnisharp)
--   2. Restart Neovim - it will auto-enable
--   3. (Optional) Add custom config at ~/.config/nvim/lsp/<server>.lua
--
-- ============================================================================

local Plugin = { 'neovim/nvim-lspconfig' }

Plugin.dependencies = {
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' }, -- Needed for capabilities
}

Plugin.cmd = { 'LspInstall', 'LspUnInstall' }

Plugin.event = { 'BufReadPre', 'BufNewFile' }

function Plugin.config()
    local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

    -- Diagnostic signs
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '✘',
                [vim.diagnostic.severity.WARN] = '▲',
                [vim.diagnostic.severity.HINT] = '⚑',
                [vim.diagnostic.severity.INFO] = 'I',
            },
        },
        virtual_text = true,
        float = {
            border = 'rounded',
        },
    })

    -- Setup cmp capabilities for all LSP servers using the new 0.11 API
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config('*', {
        capabilities = cmp_capabilities,
    })

    -- LspAttach autocommand for keymaps
    -- Note: Neovim 0.11 provides default keymaps for many LSP functions:
    --   grn: vim.lsp.buf.rename()
    --   grr: vim.lsp.buf.references()
    --   gri: vim.lsp.buf.implementation()
    --   gra: vim.lsp.buf.code_action() (in Normal and Visual mode)
    --   CTRL-S: vim.lsp.buf.signature_help() (in Insert mode)
    --   K: vim.lsp.buf.hover() (already default)
    vim.api.nvim_create_autocmd('LspAttach', {
        group = group,
        desc = 'LSP actions',
        callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', 'grt', function() vim.lsp.buf.type_definition() end, opts)
            vim.keymap.set('n', 'grd', function() vim.lsp.buf.declaration() end, opts)
            vim.keymap.set({ 'n', 'x' }, 'gq', function() vim.lsp.buf.format({ async = true }) end, opts)

            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, opts)
            vim.keymap.set({ 'i', 's' }, '<C-s>', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, opts)
        end
    })

    -- Server-specific configurations are auto-loaded from:
    --   ~/.config/nvim/lsp/<server>.lua
    -- The file must return a table with the config and be named after the server.
    -- Example: ~/.config/nvim/lsp/lua_ls.lua (not luals.lua!)

    -- Enable all installed servers from mason
    -- Neovim 0.11 will auto-load configs from the lsp/ folder
    local installed_servers = require('mason-lspconfig').get_installed_servers()
    for _, server in ipairs(installed_servers) do
        vim.lsp.enable(server)
    end
end

return Plugin
