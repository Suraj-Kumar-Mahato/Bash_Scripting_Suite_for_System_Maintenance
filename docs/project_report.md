# Project Report - Bash Scripting Suite for System Maintenance

This project focuses on developing a **Bash Scripting Suite** that automates common system maintenance tasks in Linux. The goal is to enhance productivity, reduce repetitive manual work, and improve system health monitoring. The suite provides lightweight, easy-to-use scripts that are suitable for personal systems and small server administration.

#### Components
1. **backup.sh** - Automates directory backups by creating timestamped compressed archives. The script accepts an optional source and destination directory. It uses `tar` to preserve file metadata and stores backups in a user-specified directory (default: $HOME/backup). The implementation ensures directories are created when missing and filenames avoid collisions by including timestamps.
2. **update_cleanup.sh** - Automates package updates and cleanup operations. Designed to run on Debian-based systems, it executes `apt update`, `apt upgrade`, and performs `autoremove` and `autoclean`. The script enforces root execution to prevent permission issues and is suitable for scheduled maintenance via cron or manual invocation.
3. **log_monitor.sh** - Scans log files for common failure keywords (e.g., "error", "fail", "critical", "panic"). Matching lines are saved to a timestamped output file. If no matches are found the temporary file is removed. This approach provides quick triage data for administrators to investigate issues efficiently.
4. **maintenance_menu.sh** - An interactive, terminal-based menu that ties the suite together. Users can choose to run backups, updates, or log scans from a single interface. The menu includes safeguards for operations that require elevated privileges and asks for confirmation before executing system-updating commands.

#### Design Decisions & Extensibility
The project emphasizes **modularity**: each script performs a clear task and can be used independently or combined. The menu script uses relative paths to allow the suite to be copied and executed without additional configuration. Error handling uses `set -euo pipefail` where appropriate to fail early and avoid partial state changes. Logging and output files include timestamps to make results auditable and to support historical diagnostics.

Because the suite is modular, it is straightforward to extend. Additional scripts could include disk usage alerts, user account audits, automated security checks, or integration with remote backup services. Each new script can be added to the `scripts/` folder and referenced in the menu with minimal changes.

#### Testing & Usage
Testing was performed on an Ubuntu environment. Each script includes input validation and helpful messages. The backup script was tested against directories with nested paths and files containing spaces. The update script was tested in a VM to ensure safe package upgrades. Log scanning was tested with sample logs placed in `test/test_logs/` to verify keyword detection behavior.

#### Conclusion
This Bash Scripting Suite offers practical automation for frequently recurring maintenance tasks. It demonstrates the power of simple, well-structured shell scripts to solve real-world problems, and provides a clean base for further feature additions. The repository is organized for clarity, reproducibility, and easy submission to version control systems like GitHub.
