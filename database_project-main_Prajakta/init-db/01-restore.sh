#!/bin/bash
set -e

# Check if backup.sql exists and restore it
if [ -f /backup/backup.sql ]; then
    echo "Restoring database from backup.sql..."
    psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /backup/backup.sql
else
    echo "No backup.sql file found. Skipping restore."
fi
