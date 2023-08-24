# To crete a banch on a worktree
# and setup the env to be ready to code


git worktree add -b fix_BG-5051_Mini-bag-auto-display-upon-add-item b-mini-bag-open

cd b-mini-bag-open/

cp .env.sample .env

ln -n ../.rgignore .

nvm use

yarn

