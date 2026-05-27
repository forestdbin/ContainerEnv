#!/bin/bash

docker run \
    --rm \
    --name foo-cxx \
    -it \
    -u billd \
    -h dev-cxx \
    -w /home/billd \
    -v myhome:/home/billd \
    x-cxx:1 \
    /bin/bash
