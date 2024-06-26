#!/bin/bash
/wait-for-it.sh db:3306 --strict --timeout=300 -- &&
python manage.py collectstatic --noinput &&
python manage.py runserver 0.0.0.0:8000