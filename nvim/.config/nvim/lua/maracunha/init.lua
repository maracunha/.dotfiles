require("maracunha.set")
require("maracunha.remap")

local augroup = vim.api.nvim_create_augroup
local MaracunhaGroup = augroup('Maracunha', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- Do not what is it
function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = MaracunhaGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


vim.g.netrw_winsize = 25
