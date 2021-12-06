
# chande nvm to n

allways on git 
rebase
squach

git rebase <current Tag>

# Stow
stow <directory>
stow -D <directory>

# Tmux
tmux kill-server
tmux split-window -h
tmux neww
tmux split-window -p 22 -h bash
tmux new-session -s foo
tmux list-server
tmux new-session -s "static-ticket" -d -c "$HOME/dev/hi/static-ticket" ns
tmux switch-client -t "foobar"

# Docker
docker container run myImage — Create a new container and start it. You’ll probably want some flags here.
docker image build -t myRepo/myImage:myTag . — Build an image.

## Containers
Use docker container myCommand

create — Create a container from an image.
start — Start an existing container.
run — Create a new container and start it.
ls — List running containers.
inspect — See lots of info about a container.
logs — Print logs.
stop — Gracefully stop running container.
kill —Stop main process in container abruptly.
rm— Delete a stopped container.
## Images
Use docker image myCommand

build — Build an image.
push — Push an image to a remote registry.
ls — List images.
history — See intermediate image info.
inspect — See lots of info about an image, including the layers.
rm — Delete an image.
