#!/bin/bash
# maintenance_menu.sh - Simple interactive menu to run maintenance scripts.
# Usage: ./maintenance_menu.sh (execute from scripts/ directory)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    echo "================= SYSTEM MAINTENANCE SUITE ================="
    echo "1) Backup files (backup.sh)"
    echo "2) Update & cleanup system (update_cleanup.sh)"
    echo "3) Monitor logs (log_monitor.sh)"
    echo "4) Show backup directory contents"
    echo "5) Exit"
    echo "=========================================================="
    read -rp "Choose an option [1-5]: " choice
    case "$choice" in
        1)
            read -rp "Enter source directory (default: \$HOME/Documents): " src
            src="${src:-$HOME/Documents}"
            "$SCRIPT_DIR/backup.sh" "$src"
            read -rp "Press enter to continue..."
            ;;
        2)
            echo "This will run apt update/upgrade and cleanup. sudo will be required."
            read -rp "Proceed? [y/N]: " yn
            case "$yn" in
                [Yy]*)
                    sudo "$SCRIPT_DIR/update_cleanup.sh"
                    ;;
                *) echo "Cancelled." ;;
            esac
            read -rp "Press enter to continue..."
            ;;
        3)
            read -rp "Enter log file to scan (default: /var/log/syslog): " logf
            logf="${logf:-/var/log/syslog}"
            "$SCRIPT_DIR/log_monitor.sh" "$logf"
            read -rp "Press enter to continue..."
            ;;
        4)
            ls -lah "$HOME/backup" || echo "No backups found."
            read -rp "Press enter to continue..."
            ;;
        5) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option." ; read -rp "Press enter to continue..."; ;
    esac
done
