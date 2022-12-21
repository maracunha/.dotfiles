local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust" },

  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    -- use_languagetree = true,
    enable = true, -- false will disable the whole extension
    -- disable = { "css", "html" }, -- list of language that will be disabled
    -- disable = { "css", "markdown" }, -- list of language that will be disabled
    -- disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
}
