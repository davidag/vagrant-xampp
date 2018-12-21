## Features
* libvirt-based vagrant file
* Vagrant box: Debian stretch x64
* XAMPP 7.3.0
* Access web site (from host): `http://localhost:8000`
* Access phpMyAdmin (from host): `http://localhost:8000/phpmyadmin`

## Howto
```
# Start development machine
$ make start

# Stop development machine
$ make stop

# Restart development machine
$ make restart

# Synchronize host web to development machine
$ make sync

# SSH into development machine
$ make ssh
```
