#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

echo "Waiting for database to be ready..."
/wait-for-it.sh db:3306 --strict --timeout=300 -- echo "Database is ready"

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting Gunicorn..."
exec gunicorn --bind 0.0.0.0:8080 WeinhandelDjP.wsgi:application