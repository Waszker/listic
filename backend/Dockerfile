# Use an official Python runtime as a parent image
FROM python:3.13-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install poetry
RUN pip install poetry==1.7.1 # Pinning poetry version for stability

# Copy only requirements to cache them
COPY pyproject.toml poetry.lock* ./

# Install project dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-dev --no-interaction --no-ansi

# Copy project
COPY . .

# Expose port 8000
EXPOSE 8000

# Run the application
CMD ["gunicorn", "listic.wsgi:application", "--bind", "0.0.0.0:8000"]
