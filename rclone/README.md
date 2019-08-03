# rclone
1. docker run --privileged -v /etc/ssl:/etc/ssl -v $PWD/src:/root -it twhtanghk/rclone bash
2. rclone mount --vfs-cache-mode writes gdrive: ~/gdrive
3. encfs ~/gdrive/.raw ~/crypt
