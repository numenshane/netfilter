#!/bin/bash
docker -H $DOCKER_HOST inspect $(docker -H $DOCKER_HOST ps -aq) | jq -c -M -r ".[]"
