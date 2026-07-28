#!/bin/bash

# ==========================
# Log Analyzer
# Author: Ziad Elmelegy
# Description: Analyzes a log file for error countsm top IP addresses and hourly error tends.
# Usage: ./log-analyzer.sh
# ==========================

LOG_FILE="log.log"
if [ ! -f "${LOG_FILE}" ]; then
    if [ -f "logs-generator.py" ]; then
        echo "⚠️ log file 'log.log' not found!"
        echo "🚀 Automatically running 'logs_generator.py to nootstrap mock data... "

        python3 logs_generator.py
        echo "---------------------------"
    else
        echo " no logs to analyze and logs generator not found"

    fi
fi
echo "======================================="
echo " Log Analyzer Report "
echo " File: ${LOG_FILE} "
echo " Generated: $(date) "
echo "======================================="

# ---2. Total number of lines ----
TOTAL_LINES=$(wc -l < "${LOG_FILE}")
echo " Total log lines: ${TOTAL_LINES}"
echo ""
echo "======================================="

# ----- 3. count of ERROR lines ---
ERROR_COUNT=$(grep -ci "ERROR" "$LOG_FILE")
echo "------------- Error Count -------------"
echo " Total ERROR  lines: $ERROR_COUNT"
echo ""
echo "======================================="

# ----- 4. Top 5 most frequent IP adersses ----
echo "--------- Top 5 IP Addresses ----------"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo ""
echo "======================================="


# ----- 5. Error distriburion by hour ----
echo "----- Numbers of Errors per hour ------"
grep -i "ERROR" "$LOG_FILE" | sed -E 's/.*:([0-9]{2}):[0-9]{2}:[0-9]{2}[] ].*/\1/' | sort | uniq -c | sort -k2
echo ""
echo "======================================="
echo " End of report"
echo "======================================="