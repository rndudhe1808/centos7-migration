dnf update —allowerasing
sudo dnf update
sudo dnf install centos-release-stream -y
sudo dnf swap centos-linux-repos centos-stream-repos -y 
sudo dnf distro-sync 
sudo systemctl reboot
