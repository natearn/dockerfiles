#!/bin/bash

# change these for an easier experience
IMAGE_NAME="$1"
CONTAINER="$2"
COMMAND="bash"

if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]];
then docker build -t $IMAGE_NAME .
fi

if docker inspect -f '{{.State.Running}}' "$CONTAINER" &> /dev/null
then docker exec -it "$CONTAINER" "$COMMAND"
else docker run -it --rm --name "$CONTAINER" \
  -v $(pwd):"/home/stack/app" \
  -v "/home/stack/app/.stack-work" \
  "$IMAGE_NAME" \
  "$COMMAND"
fi
