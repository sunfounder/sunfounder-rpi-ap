# SunFounder AP

A helper script to automatically host a access point on Raspberry Pi.

SSID and password are stored in `/etc/sunfounder-ap.conf`.

## Install

```
git clone https://github.com/sunfounder/sunfounder-rpi-ap.git
cd sunfounder-rpi-ap
sudo ./install.sh
```

It will install a service `sunfounder-ap.service` that will start the access point when the system boots up. Then prompt:

```
Enter SSID [SunFounder_RPi_AP]: 
Enter Password [12345678]: 
Enter Band [2.4g]:
```

Enter the SSID and password, or enter to use the default. Then the access point will be started.

## Usage


```
# Change SSID and password
$ sudo sunfounder-ap set
Enter SSID [SunFounder_RPi_AP]: 
Enter Password [12345678]: 
# Restart the access point
$ sudo systemctl restart sunfounder-ap
```

