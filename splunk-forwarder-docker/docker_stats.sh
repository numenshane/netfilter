#!/bin/bash
#DOCKER_HOST=tcp://10.77.131.41:2375
docker -H $DOCKER_HOST stats --no-stream=true $(docker -H $DOCKER_HOST ps -q) \
  | tail -n +2 \
  | grep -Ev "\w+\s+0\.00%\s+0\sB/0\sB\s+0\.00%\s+0\sB/0\sB\s+0\sB/0\sB" \
  | sed 's/\//  /g' \
  | sed -E 's/\s\s+/,/g'
