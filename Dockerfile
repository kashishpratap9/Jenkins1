# Use a slim version of Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements file first (this will cache the dependencies layer if unchanged)
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt --no-cache-dir

# Copy the rest of the application code into the container
COPY . .

# Expose port 5000 for the Flask app to be accessible outside
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
