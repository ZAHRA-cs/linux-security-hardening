#!/bin/bash

#This function checks usage and prints a warning if it gets over 80% 
check_disk() {
       if df -h | grep -q -E "[89][0-9]%|100%"; then
  echo "ALERT:partition is over 80% full"
else
  echo "Everything is within norm"
fi 
} 

#This function prints RAM usage
check_memory() {
   free -h
}

#This function takes a service name and checks if its active
check_service() {
if systemctl is-active -q $1; then
  echo "$1 is active"
else
  echo "ALERT: $1 is inactive"
fi
}


check_disk
check_memory
check_service cron
