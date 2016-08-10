#!/bin/bash
#DOCKER_HOST="tcp://10.77.131.41:2375"
for container_id in $(docker -H $DOCKER_HOST ps -q); do
  command_date=$(date -u +%Y-%m-%dT%H:%M:%S%z)
  docker -H $DOCKER_HOST top $container_id \
    -Ao pid,ppid,pgid,pcpu,vsz,nice,etime,time,tty,ruser,user,rgroup,group,comm,args:1000 | \
    tail -n +2 | \
    sed -E 's/"/""/g' | \
    sed -E 's/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/; s/  +/","/' | \
    sed -E "s/^(.*)$/\"$command_date\",\"$container_id\",\"\1\"/"
done
