#!/bin/bash

service docker start

python manage.py runserver 0.0.0.0:6000
