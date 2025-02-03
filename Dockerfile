# Use the official Python image from the Docker Hub
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /code

# Install Python dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project
COPY ./accounts/ /code/accounts/
COPY ./shop/ /code/shop/
COPY ./static/ /code/static/
COPY ./WeinhandelDjP/ /code/WeinhandelDjP/
COPY ./manage.py /code/manage.py
COPY ./requirements.txt /code/requirements.txt
COPY ./weinhandel.sql /code/weinhandel.sql

# Copy wait-for-it script
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the start script
CMD ["/start.sh"]