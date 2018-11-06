drm() { docker rm -f $* $(docker ps -q -a); }
drmi() { docker rmi -f $(docker images -q); }
