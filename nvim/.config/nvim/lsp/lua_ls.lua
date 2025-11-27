-- ============================================================================
-- Lua Language Server (lua_ls)
-- ============================================================================
--
-- WHAT THIS DOES:
--   LSP server for Lua files. Provides completions, diagnostics,
--   go-to-definition, etc. for Lua code including Neovim config.
--
-- KEY SETTINGS:
--   - globals = { 'vim' }    Recognizes vim as a valid global
--   - library = runtime      Understands Neovim API (vim.api, vim.lsp, etc.)
--   - checkThirdParty        Disabled to avoid annoying prompts
--
-- INSTALL:
--   :MasonInstall lua-language-server
--
-- ============================================================================

return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
