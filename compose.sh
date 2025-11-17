#!/bin/bash

export COMPOSE_PROJECT_NAME=foo-cxx

docker-compose up -d dev

docker-compose exec dev bash
