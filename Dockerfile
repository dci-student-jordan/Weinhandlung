# Use the official Python image from the Docker Hub
FROM python:3.11

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy project
COPY . /code/

# Copy wohnungen.sql to Docker container
COPY weinhandel.sql /docker-entrypoint-initdb.d/


# Add wait-for-it
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Run the application using wait-for-it.sh from sthe start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]