#!/bin/bash

# Define variables
POSTGRES_CONTAINER_NAME="my_postgres_container"  # Use the specified container name
BACKUP_DIR="./backup"
BACKUP_FILE="$BACKUP_DIR/backup.sql"

# Ensure the backup directory exists
mkdir -p $BACKUP_DIR

# Perform the backup
echo "Creating backup of the PostgreSQL database..."
docker exec $POSTGRES_CONTAINER_NAME pg_dump -U myuser -d mydatabase -f /backup/backup.sql

# Copy the backup file from the container to the host
docker cp $POSTGRES_CONTAINER_NAME:/backup/backup.sql $BACKUP_FILE

echo "Backup completed and saved to $BACKUP_FILE"

