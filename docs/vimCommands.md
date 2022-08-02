
<leader>wv       => split a window vertical
<leader>x        => make a file executable
<leader>vwh      => enter on helper on a word on cursor is 
<leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
<leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

 git things
<leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
<leader>gln :cnext<CR>:call search(_search_term)<CR>
<leader>glp :cprev<CR>:call search(_search_term)<CR>

 greatest remap ever
xnoremap <leader>p "_dP

 <leader>y "+y
 <leader>y "+y
 Y yg$

" center cursor on quick find
 n nzzzv
 N Nzzzv
 J mzJ`z

"copy hole file
 <leader>Y gg"+yG

 <leader>d "_d
 <leader>d "_d
