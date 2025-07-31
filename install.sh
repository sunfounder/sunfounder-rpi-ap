#!/bin/bash

set -euo pipefail
trap 'echo "Error occurred. Exiting..." >&2; exit 1' ERR


# Check if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo "Installing SunFounder-AP..."
# Copy files to /usr/local/bin
cp sunfounder-ap /usr/local/bin/
# Add execute permission to sunfounder-ap
chmod +x /usr/local/bin/sunfounder-ap
# Create a service for sunfounder-ap
cp sunfounder-ap.service /etc/systemd/system/
# Reload the systemd daemon
systemctl daemon-reload
# Enable the service
systemctl enable sunfounder-ap.service
# Set SSID and Password
sunfounder-ap set
# Start the service
systemctl start sunfounder-ap.service

echo "SunFounder-AP installed successfully!"
