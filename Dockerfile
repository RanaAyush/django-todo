FROM python:3
# Use a specific Python version with Debian as the base image
FROM python:3.9-slim-buster

# Install system dependencies required for Python packages
RUN apt-get update && apt-get install -y \
    python3-distutils \
    python3-dev \
    python3-pip \
    build-essential \
    && apt-get clean

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip setuptools wheel
RUN pip install django==3.2
COPY . . 
RUN python manage.py migrate
CMD ["python","manage.py","runserver","0.0.0.0:8000"]

