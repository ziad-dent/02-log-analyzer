# Log Analyzer Bash Script

A shell script that analyzes system/application log files for total log volume, error counts, top visiting IP addresses, and hourly error distribution. Fully containerized with Docker.

## Features
- Automatic mock data generation using Python (logs_generator.py).
- Total log line count & error filtering using grep.
- Frequent IP extraction using awk and uniq.
- Hourly error trend analysis using sed RegEx.
- **Containerized**: Ready to run anywhere using Docker with a lightweight Alpine-based Python image.

## Usage
```bash
chmod +x log_analyzer.sh
./log_analyzer.sh
