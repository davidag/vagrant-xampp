#!/usr/bin/env bash

[ "$UID" != "0" ] && { echo "Run with sudo!"; exit 1; }

export DEBIAN_FRONTEND=noninteractive

# Update packages to get the most recent versions
apt-get update

# Select english locale, because none is selected by default
echo locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8 | debconf-set-selections
echo locales locales/default_environment_locale select en_US.UTF-8 | debconf-set-selections
sed -i 's/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
dpkg-reconfigure --frontend=noninteractive locales

# XAMPP
if ! [ -d "/opt/lampp" ]; then
    echo "Intalling package dependencies..."
    apt-get -qy install net-tools
    echo "Downloading xampp..."
    wget -q https://www.apachefriends.org/xampp-files/7.3.0/xampp-linux-x64-7.3.0-0-installer.run
    chmod 755 xampp-linux-*-installer.run
    echo "Installing xampp..."
    ./xampp-linux-*-installer.run
    rm -f xampp-linux-*-installer.run
    echo "Setting up xampp auto-start..."
    ln -s /opt/lampp/lampp /etc/init.d/lampp
    update-rc.d lampp start 80 2 3 4 5 . stop 30 0 1 6 .
    echo "Enabling access to phpMyAdmin from host machine..."
    sed -i 's/Require local/Require all granted/' /opt/lampp/etc/extra/httpd-xampp.conf
    echo "Starting xampp..."
    /opt/lampp/lampp start
fi

