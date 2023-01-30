-- Remaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Maracunha_Fugitive= vim.api.nvim_create_augroup("Maracunha_Fugitive", {})
local autocmd = vim.api.nvim_create_autocmd

-- When enter on fugitive buffer
autocmd("BufWinEnter", {
  group = Maracunha_Fugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>gpsh", function()
      vim.cmd.Git('push')
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<leader>gp", function()
      vim.cmd.Git({'pull --rebase'})
    end, opts)

    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
    -- needed if i did not set the branch up correctly
    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
  end,
})

-- this for merge conflicts
-- nmap("<leader>gh", ":diffget //3<CR>")
--nmap("<leader>gu", ":diffget //2<CR>")
--nmap("<leader>gs", ":G<CR>")



