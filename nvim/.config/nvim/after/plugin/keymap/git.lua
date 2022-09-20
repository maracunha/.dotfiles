local Remap = require("maracunha.keymap")
local nnoremap = Remap.nnoremap
local nmap = Remap.nmap

nnoremap("<leader>u", ":UndotreeShow<CR>")
nnoremap("<leader>ga", ":Git fetch --all<CR>")

-- let see if need this
-- nnoremap(<leader>grum :Git rebase upstream/main<CR>
-- nnoremap(<leader>grom :Git rebase origin/main<CR>

-- this for merge conflicts
nmap("<leader>gh", ":diffget //3<CR>")
nmap("<leader>gu", ":diffget //2<CR>")
nmap("<leader>gs", ":G<CR>")

