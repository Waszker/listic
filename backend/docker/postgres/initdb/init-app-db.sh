#!/bin/bash
set -euo pipefail # Exit immediately if a command exits with a non-zero status.

# Perform all actions as the postgres superuser
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Create the application user if it doesn't exist
    DO
    \$do\$
    BEGIN
       IF NOT EXISTS (
          SELECT FROM pg_catalog.pg_roles
          WHERE  rolname = '$DJANGO_DB_USER') THEN

          CREATE USER $DJANGO_DB_USER WITH PASSWORD '$DJANGO_DB_PASSWORD';
       END IF;
    END
    \$do\$;

    -- Grant all privileges on the application database to the user
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $DJANGO_DB_USER;

    -- Grant necessary privileges on the public schema
    GRANT USAGE ON SCHEMA public TO $DJANGO_DB_USER;
    GRANT CREATE ON SCHEMA public TO $DJANGO_DB_USER; -- Explicitly grant CREATE permission
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $DJANGO_DB_USER;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $DJANGO_DB_USER;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO $DJANGO_DB_USER;
    ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON SEQUENCES TO $DJANGO_DB_USER;

EOSQL

echo "****** APP DATABASE USER '$DJANGO_DB_USER' CREATED AND GRANTED PRIVILEGES ON DATABASE '$POSTGRES_DB' ******"
