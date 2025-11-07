#!/bin/bash
# update_cleanup.sh - Update packages and clean up unnecessary packages.
# Usage: sudo ./update_cleanup.sh
set -euo pipefail

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)." >&2
  exit 1
fi

echo "Updating package lists..."
apt update -y

echo "Upgrading packages..."
DEBIAN_FRONTEND=noninteractive apt upgrade -y

echo "Removing unnecessary packages..."
apt autoremove -y
apt autoclean -y

echo "Update and cleanup complete."
