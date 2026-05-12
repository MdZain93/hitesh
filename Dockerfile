# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy project files into container
COPY requirements.txt .

# Install dependencies (if requirements.txt exists)
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Expose application port (optional)
EXPOSE 5000

# Default command to run app
CMD ["python", "app.py"]
