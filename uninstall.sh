#!/bin/bash

set -euo pipefail
trap 'echo "Error occurred. Exiting..." >&2; exit 1' ERR

# Check if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

CONFIG_FILE="/etc/sunfounder-ap.conf"
AP_CONFIG_NAME="SUNFOUNDER_AP"

echo "Uninstalling SunFounder-AP..."

# Remove the service
systemctl stop sunfounder-ap.service 2>/dev/null || true
systemctl disable sunfounder-ap.service 2>/dev/null || true
rm /etc/systemd/system/sunfounder-ap.service 2>/dev/null || true

# Remove the executable
rm /usr/local/bin/sunfounder-ap 2>/dev/null || true

# Remove the configuration file
rm $CONFIG_FILE 2>/dev/null || true

# Remove the network configuration
nmcli device disconnect wlan0 2>/dev/null || true 
nmcli connection delete $AP_CONFIG_NAME 2>/dev/null || true
nmcli device up wlan0 2>/dev/null || true

echo "SunFounder-AP has been uninstalled."
