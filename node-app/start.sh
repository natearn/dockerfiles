#!/bin/bash

# change these for an easier experience
IMAGE_NAME="$1"
CONTAINER="$2"
COMMAND="sh"

if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]];
then docker build -t $IMAGE_NAME .
fi

if docker inspect -f '{{.State.Running}}' "$CONTAINER" &> /dev/null
then docker exec -it "$CONTAINER" "$COMMAND"
else docker run -it --rm --name "$CONTAINER" \
  -v $(pwd):/home/node/app \
  -v /home/node/app/node_modules \
  "$IMAGE_NAME" \
  "$COMMAND"
fi
