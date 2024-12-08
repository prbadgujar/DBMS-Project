@echo off
REM Define variables
SET POSTGRES_CONTAINER_NAME=my_postgres_container
SET BACKUP_DIR=backup
SET BACKUP_FILE=%BACKUP_DIR%\backup.sql

REM Ensure the backup directory exists
IF NOT EXIST %BACKUP_DIR% (
    mkdir %BACKUP_DIR%
)

REM Perform the backup
echo Creating backup of the PostgreSQL database...
docker exec %POSTGRES_CONTAINER_NAME% pg_dump -U myuser -d mydatabase -f /backup/backup.sql

REM Copy the backup file from the container to the host
docker cp %POSTGRES_CONTAINER_NAME%:/backup/backup.sql %BACKUP_FILE%

echo Backup completed and saved to %BACKUP_FILE%
