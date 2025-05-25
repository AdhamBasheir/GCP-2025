# Use the official Python 3.8 slim image as a base
FROM python:3.8-slim

# Install Redis inside the container
RUN apt-get update && apt-get install -y redis-server

# Install necessary dependencies
RUN apt-get install -y gcc python3-dev libffi-dev

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install the Python dependencies (redis, tornado)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Set environment variables
ENV ENVIRONMENT=DEV
ENV HOST=0.0.0.0
ENV PORT=8000
ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV REDIS_DB=0

# Expose both the Redis and app ports
EXPOSE 6379 8000

# Start Redis and the app (tornado) when the container runs
CMD ["sh", "-c", "service redis-server start && python hello.py"]


# docker build -t myapp .
# docker run -p 8000:8000 myapp

# docker {URL}/my-image
# docker push {URL}/my-image
