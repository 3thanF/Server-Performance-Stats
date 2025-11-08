# SERVER-STATS.SH — KEY ASPECTS

## Purpose:
Provides a quick overview of a Linux server’s performance and health.

## Main Stats Collected:

* CPU usage

* Memory usage (total, used, free, percentage)

* Disk usage (total, used, free, percentage)

* Top 5 processes by CPU usage

* Top 5 processes by memory usage

## Additional System Info:

* OS version, kernel, and architecture

* System uptime and load averages (1m, 5m, 15m)

* Logged-in users

* Failed login attempts (if available)

## Tools Used:
```top```, ```free```, ```df```, ```ps```, ```awk```, ```grep```, ```who```, ```uptime```, ```hostnamectl```, ```faillog``` or ```lastb```.

## Usage:

Make executable: ```chmod +x server-stats.sh```

Run: ```./server-stats.sh```

For full results (failed logins): ```sudo ./server-stats.sh```

## Output Format:
Clear, sectioned report with readable labels and a timestamp.

## Compatibility:
Works on most Linux systems with standard command-line tools installed.

## Purpose of Each Section:

System info → Identifies environment

Uptime & load → Shows stability and load

User info → Tracks active and failed sessions

Resource stats → Measures system performance