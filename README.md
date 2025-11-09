# Bash_Scripting_Suite_for_System_Maintenance

# Bash System Maintenance Suite

A modular suite of Bash scripts to automate common Linux system maintenance tasks: backups, updates & cleanup, log monitoring, and an interactive maintenance menu.

## Repository structure
```
bash-system-maintenance-suite/
├── README.md
├── LICENSE
├── scripts/
│   ├── backup.sh
│   ├── update_cleanup.sh
│   ├── log_monitor.sh
│   └── maintenance_menu.sh
├── docs/
│   └── project_report.md
├── assets/
│   └── screenshots/
└── test/
    └── test_logs/
```

## Setup & Usage

1. Clone the repository to your Linux machine
```bash
git clone <repo-url>
cd bash-system-maintenance-suite/scripts
```

2. Make scripts executable (already set in this package):
```bash
chmod +x *.sh
```

3. Run the interactive menu:
```bash
./maintenance_menu.sh
```

Or run individual scripts:
```bash
./backup.sh /path/to/dir   # optional directory argument, defaults to $HOME/Documents
./update_cleanup.sh
./log_monitor.sh /var/log/syslog
```

## Requirements
- Linux (Ubuntu/Debian tested)
- Bash shell
- sudo privileges for update/cleanup operations
- tar, gzip (usually preinstalled)

## Development / Git Pattern
- Create a feature branch per feature: `git checkout -b feature/backup-script`
- Commit small units with descriptive messages
- Use tags/releases for final submission (e.g., `v1.0`)
- Keep README and docs updated

d

