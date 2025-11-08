#!/bin/bash

# server-stats.sh - A script to display server statistics

echo "==============================="
echo " SERVER PERFORMANCE STATISTICS "
echo "==============================="


# OS & Kernel Information
echo "Operating System and Kernel Information:"
hostnamectl | grep -E 'Operating System|Kernel|Architecture'
echo "-------------------------------"

# Uptime Information and Load Average
echo "Uptime and Load Average:"
uptime -p
echo "Load Average: (1m, 5m, 15m) : $(uptime | awk -F'load average:' '{ print $2 }')"
echo "-------------------------------"

# Logged-in Users
echo "Currently Logged-in Users:"
who | awk '{print $1, $2, $3}' || echo "No users currently logged in."
echo "-------------------------------"

# Failed Login Attempts
echo "Failed Login Attempts in the Last 24 Hours:"
if command -v faillog &> /dev/null; then
    sudo faillog -a | awk 'NR<=10'
elif command -v lastb &> /dev/null; then
    sudo lastb | head -n 10
else
    echo "No failed login log tool available (faillog/lastb not found)."
fi
echo "-------------------------------"


# Display CPU usage
echo "CPU Usage:"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "Current CPU Usage: $CPU_USAGE"
echo "-------------------------------"

# Display Memory usage
echo "Memory Usage:"
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERCENT=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100.0}')

echo "Total Memory: ${MEM_TOTAL}MB"
echo "Used Memory: ${MEM_USED}MB"
echo "Free Memory: ${MEM_FREE}MB"
echo "Memory Usage Percentage: ${MEM_PERCENT}%"
echo "-------------------------------"

# Display Disk usage
echo "Disk Usage:"
df -h --total | grep total | awk '{print "Total Size: "$2", Used: "$3", Available: "$4", Usage Percentage: "$5}'
echo "-------------------------------"

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu,%mem --sort=%mem | head -n 6

echo "==============================="
echo "        END OF STATISTICS      "
echo "      Generated on: $(date)    "
echo "     Hostname: $(hostname)     "
echo "==============================="