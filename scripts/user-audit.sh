#!/bin/bash 

# Day 1 - User Audit Script
# What this does: lists all users and flags root-level accounts

echo "===== USER AUDIT REPORT ====="
echo "Date: $(date)"
echo ""

echo "--- All system users ---"
cat /etc/passwd | cut -d: -f1,3,6

echo "" 
echo "--- Users with UID 0 (root-level, investigate these) ---"
awk -F: '$3 == 0 {print $1}' /etc/passwd

echo ""
echo "--- Users with login shell (real human accounts) ---"
grep -v '/nologin\|/false' /etc/passwd | cut -d: -f1,7

echo ""
echo "===== END OF REPORT ====="
