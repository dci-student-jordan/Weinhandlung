# Weinhandlung
a fictional winery created in Django

Django Project created during my internship for the Packend Developer Course at the DCI.

## Some features of this app:

- Staff can manage Vines and Vintages, list sales and reserved or purchased orders by user, date, price, vintage etc...
- Users can place orders, add to whishlist, manage their cart and account data...

## Try out with docker
Supposed you have docker compose installed, simply run "docker compose up --build" and visit [0.0.0.0:8080](0.0.0.0:8080)

## Try it out manually
To test clone this repo, create a venv, activate, run pip install -r requirements (supposing you have mysql installed), run the weinhandel.sql to create and populate the db, and then run python manage.py runserver and enjoy.

To test as staff user login as Staffy, pw cde3456