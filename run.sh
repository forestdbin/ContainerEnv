#!/bin/bash

docker run \
    --rm \
    --name foo \
    -it \
    -u billd \
    -h dev-host \
    -w /home/billd \
    x-dev:1 \
    /bin/bash
