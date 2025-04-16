# Listic - AI Shopping List Generator

## Development Setup

### Prerequisites

- Docker
- Docker Compose

### Running the Application

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd listic
    ```

2.  **Environment Variables:**
    - Create a `.env` file in the `backend/` directory by copying the example:
      ```bash
      cp backend/.env.example backend/.env
      ```
    - **Important:** Modify the `SECRET_KEY` in `backend/.env` for production deployments.

3.  **Build and Run with Docker Compose:**
    ```bash
    docker compose up --build
    ```
    This command will build the Docker images (if they don't exist or have changed) and start the backend, database, and Nginx services.

4.  **Access the Application:**
    - The backend API will be available at [http://localhost:8000/api/](http://localhost:8000/api/)
    - The Django admin interface will be at [http://localhost:8000/admin/](http://localhost:8000/admin/)

5.  **Initial Database Setup (First Time Only):**
    After the containers are running, you need to apply database migrations and create a superuser for the Django admin:
    ```bash
    docker compose exec backend poetry run python manage.py migrate
    docker compose exec backend poetry run python manage.py createsuperuser
    ```
    Follow the prompts to create your admin user.

6.  **Stopping the Application:**
    ```bash
    docker compose down
    ```
