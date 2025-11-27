-- ============================================================================
-- OmniSharp (.NET/C# Language Server)
-- ============================================================================
--
-- WHAT THIS DOES:
--   LSP server for .NET/C# projects. Provides completions, diagnostics,
--   refactoring, and navigation for C# code.
--
-- ROOT MARKERS:
--   - *.sln           Visual Studio solution files
--   - *.csproj        C# project files
--   - omnisharp.json  OmniSharp config file
--
-- KEY SETTINGS:
--   - EnableEditorConfigSupport    Respects .editorconfig
--   - EnableAnalyzersSupport       Enables Roslyn analyzers
--
-- FORMATTER (optional):
--   dotnet tool install -g csharpier
--
-- ============================================================================

return {
    root_markers = {
        '*.sln',
        '*.csproj',
        'omnisharp.json',
        '.git',
    },
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
        },
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
        },
    },
}
