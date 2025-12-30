#!/bin/bash

export COMPOSE_PROJECT_NAME=foo

docker-compose up -d dev

docker-compose exec dev bash
