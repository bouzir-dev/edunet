# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app

# Set PYTHONPATH to ensure Django finds the app
ENV PYTHONPATH=/app

# Expose the port the app runs on
EXPOSE 8000

# Set the environment variable for Django
ENV DJANGO_SETTINGS_MODULE=e_learning_platform.settings

# Run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
