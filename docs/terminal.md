# Terminal items

## Stow
stow <directory>
stow -D <directory>

On a root directory of .dotfiles and run to stow all directories

```shell
install
```

## Tmux
tmux kill-server
tmux split-window -h
tmux neww
tmux split-window -p 22 -h bash
tmux new-session -s foo
tmux list-server
tmux new-session -s "static-ticket" -d -c "$HOME/dev/hi/static-ticket" ns
tmux switch-client -t "foobar"
