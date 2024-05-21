dnf update —allowerasing
dnf update
dnf install centos-release-stream -y
dnf swap centos-linux-repos centos-stream-repos -y 
dnf distro-sync 
systemctl reboot
