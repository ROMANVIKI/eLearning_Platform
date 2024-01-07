FROM python:3.10.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /code

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libpq-dev

RUN apt-get install -y python3-psycopg2

# Install dependencies
RUN pip install --upgrade pip

COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy the Django project
COPY . /code/
