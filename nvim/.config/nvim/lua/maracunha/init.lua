require("maracunha.set")
require("maracunha.packer")
require("maracunha.cmd")

local augroup = vim.api.nvim_create_augroup
MaracunhaGroup = augroup('Maracunha', {})

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
