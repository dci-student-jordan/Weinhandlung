# Weinhandlung
a fictional winery created in Django

This is a Django Project created during my internship for the Backend Developer Course at the DCI.

## Some features of this app:
- Staff can manage Vines and Vintages, list sales and reserved or purchased orders by user, date, price, vintage etc...
- Users can place orders, add to whishlist, manage their cart and account data...
- Everybody else can browse Products and vintages.

## Try it out
This app is for testing purposes [deployed here](https://weinhandlung-production.up.railway.app/). Feel free to extensively try it all out, create an accound or test with credentials provided below.

You can also test it locally:

## Try out with docker
Supposed you have docker installed clone this repo and inside the root folder simply run "docker-compose up" and visit [0.0.0.0:8080](http://0.0.0.0:8080)

## Try it out manually
You can also clone, create a venv, activate, run pip install -r requirements (supposing you have mysql installed), run the weinhandel.sql to create and populate the db, and then run python manage.py runserver and enjoy.

## Test Users
To test as customer signup and play around or sign in as "Johnny", pw "ju7890ßü".
To test as staff user, login as "Staffy", pw "cde3456"