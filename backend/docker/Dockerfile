###########################
# Production image
###########################
FROM python:3.13-slim as prod-image

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
RUN pip install poetry==2.1.2 # Pinning poetry version for stability

# Copy only requirements to cache them
COPY pyproject.toml poetry.lock* ./

# Install project dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction --no-ansi --without dev

###########################
# Development image
###########################
FROM prod-image as dev-image

RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction --no-ansi