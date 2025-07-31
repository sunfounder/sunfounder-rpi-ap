#!/bin/bash

set -euo pipefail
trap 'echo "Error occurred. Exiting..." >&2; exit 1' ERR

# Check if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo "Uninstalling SunFounder-AP..."

# Remove the service
systemctl stop sunfounder-ap.service
systemctl disable sunfounder-ap.service
rm /etc/systemd/system/sunfounder-ap.service

# Remove the executable
rm /usr/local/bin/sunfounder-ap

# Remove the configuration file
rm /etc/sunfounder-ap.conf

echo "SunFounder-AP has been uninstalled."
