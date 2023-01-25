#!/bin/bash

service docker start

while true
do
    python manage.py runserver 0.0.0.0:6000
    sleep 5
done

# Use the following command instead to use gunicorn which is closer to production, however isn't ideal for development due to caching
# gunicorn openra.wsgi -w 10 -t 300 --log-file=/log/gunicorn.log -b 0.0.0.0:6000
