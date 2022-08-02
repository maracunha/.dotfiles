# Docker
docker container run myImage ‚Äî Create a new container and start it. You‚Äôll probably want some flags here.
docker image build -t myRepo/myImage:myTag . ‚Äî Build an image.

## Containers
Use docker container myCommand

create ‚Äî Create a container from an image.
start ‚Äî Start an existing container.
run ‚Äî Create a new container and start it.
ls ‚Äî List running containers.
inspect ‚Äî See lots of info about a container.
logs ‚Äî Print logs.
stop ‚Äî Gracefully stop running container.
kill ‚ÄîStop main process in container abruptly.
rm‚Äî Delete a stopped container.

## Images
Use docker image myCommand

build ‚Äî Build an image.
push ‚Äî Push an image to a remote registry.
ls ‚Äî List images.
history ‚Äî See intermediate image info.
inpect ‚Äî See lots of info about an image, including the layers.
rm ‚Äî Delete an image.
s
