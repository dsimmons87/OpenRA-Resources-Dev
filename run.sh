#!/bin/bash

echo "${@:1}"
docker-compose exec django "${@:1}"
