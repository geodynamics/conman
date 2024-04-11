This container hosts a built version of conman.

docker run -it --rm -v $HOME/conman:/home/conman_user/work conman

This command will start the conman docker image and give you terminal access. Any changes made in the /home/conman_user/work directory will be reflected on the host machine at home/conman.
