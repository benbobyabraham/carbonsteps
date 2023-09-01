FROM python:3.11.2

# Set environement variables for Python to not write .pyc files and to not buffer output
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory within the container
WORKDIR /app

# Copy the requirements file sinto the container at /app
COPY requirements.txt /app/

# Install any needed packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Expose port 8000 to docker host
EXPOSE 8000

# Start the Django developement server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]