# No More postman just use cURL + vim = ❤

https://mahmoudashraf.dev/blog/no-more-postman-just-curl-and-vim/

https://github.com/22mahmoud/vim-curl-demo

Use the command to run it :!sh %.
To close the buffer you can use command :bd!

## GET
Let's start with first and simple one api/posts/get/todos.sh.

write in the file and save.

curl -s -X GET \
    'https://jsonplaceholder.typicode.com/todos'

then as we done before run :!sh %

vim command to automated this operation
command Exec set splitright | vnew | set filetype=sh | read !sh #

