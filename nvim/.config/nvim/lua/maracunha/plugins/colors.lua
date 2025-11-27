function ApplyColor(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine-moon",

        config = function()
            require('rose-pine').setup({
                dark_variant = 'moon',
                extend_background_behind_borders = true,
            })
            ApplyColor();
        end
    },
}
