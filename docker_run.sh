#!/usr/bin/env bash
docker run -it --rm --runtime nvidia --network host -v $HOST_WORKSPACE:/workspace $IMAGE_NAME
