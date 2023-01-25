#!/bin/bash

cd $( dirname -- "$0"; )

sudo chmod 777 data/* -R

docker-compose build
