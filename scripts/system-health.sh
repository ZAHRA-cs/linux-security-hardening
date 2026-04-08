#!/bin/bash

echo "===== SYSTEM HEALTH ====="
echo "Date:$(date)"
echo ""

echo "hostname:$(hostname)"
echo ""

echo "===== Disk Space ====="
if df -h | grep -q -E "[89][0-9]%|100%"; then
  echo "ALERT:partition is over 80% full"
else
  echo "Everything is within norm"
fi
echo ""

echo "===== RAM Usage ====="
free -h
echo ""

echo "===== Top 5 CPU processes ====="
ps aux | sort -r -k 3 | head -n 5
echo ""
 
echo "===== Checking CRON activity ====="
if systemctl is-active -q cron; then
  echo "cron is active"
else 
  echo "ALERT: cron is inactive"
fi
