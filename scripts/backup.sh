#!/bin/bash
# backup.sh - Create timestamped tar.gz backups of a directory.
# Usage: ./backup.sh [SOURCE_DIR] [DEST_DIR]
set -euo pipefail

SOURCE_DIR="${1:-$HOME/Documents}"
DEST_DIR="${2:-$HOME/backup}"

mkdir -p "$DEST_DIR"

TIMESTAMP=$(date +'%F_%H-%M-%S')
BASENAME=$(basename "$SOURCE_DIR" | tr ' ' '_' )
ARCHIVE_NAME="${DEST_DIR}/${BASENAME}_backup_${TIMESTAMP}.tar.gz"

echo "Backing up '$SOURCE_DIR' to '$ARCHIVE_NAME'..."
tar -czf "$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
    echo "Backup completed: $ARCHIVE_NAME"
else
    echo "Backup failed!" >&2
    exit 1
fi
