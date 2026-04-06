#!/bin/bash

# Day 2 - Firewall Setup Script
# What this does: configures UFW with secure default rules

echo "===== FIREWALL SETUP ====="
echo "Date: $(date)"
echo ""

echo "--- Resetting UFW to defaults ---"
ufw --force reset

echo ""
echo "--- Setting default policies ---"
ufw default deny incoming
ufw default allow outgoing

echo ""
echo "--- Allowing essential services ---"
ufw allow ssh
ufw allow http
ufw allow https

echo ""
echo "--- Enabling firewall ---"
ufw --force enable

echo ""
echo "--- Current firewall status ---"
ufw status verbose

echo ""
echo "===== FIREWALL SETUP COMPLETE ====="
