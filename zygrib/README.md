# start container
xhost +
docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/zygrib
