#!/bin/bash
# log_monitor.sh - Scan log files for keywords and save findings.
# Usage: ./log_monitor.sh [LOG_FILE] [OUTPUT_FILE]
set -euo pipefail

LOG_FILE="${1:-/var/log/syslog}"
OUTPUT_FILE="${2:-$HOME/log_errors_$(date +'%F_%H-%M-%S').txt}"

KEYWORDS=("error" "fail" "critical" "panic")

if [ ! -r "$LOG_FILE" ]; then
    echo "Log file '$LOG_FILE' not readable. Exiting." >&2
    exit 1
fi

echo "Scanning '$LOG_FILE' for keywords: ${KEYWORDS[*]}"
grep -i -E "$(IFS='|'; echo "${KEYWORDS[*]}")" "$LOG_FILE" > "$OUTPUT_FILE" || true

if [ -s "$OUTPUT_FILE" ]; then
    echo "Issues found. Saved to: $OUTPUT_FILE"
    wc -l "$OUTPUT_FILE"
else
    echo "No matching log entries found."
    rm -f "$OUTPUT_FILE"
fi
