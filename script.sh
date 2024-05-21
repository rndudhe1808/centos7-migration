yum install rpmconf epel-release yum-utils -y
package-cleanup --orphans
package-cleanup --leaves
yum autoremove -y
yum install dnf -y
dnf remove yum yum-metadata-parser -y #if condition if yum not there skip actions
rm -Rf /etc/yum
dnf upgrade -y
dnf clean all -y
dnf install -y http://vault.centos.org/centos/8/BaseOS/x86_64/os/Packages/{centos-linux-repos-8-3.el8.noarch.rpm,centos-linux-release-8.5-1.2111.el8.noarch.rpm,centos-gpg-keys-8-3.el8.noarch.rpm}
dnf -y upgrade -y  https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
dnf clean all -y
rpm -e `rpm -q kernel`
rpm -e --nodeps kmod-kvdo
wget -y http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/linux-firmware-20210702-103.gitd79c2677.el8.noarch.rpm
wget -y https://vault.centos.org/centos/8/BaseOS/x86_64/os/Packages/kernel-4.18.0-348.el8.x86_64.rpm
wget -y https://vault.centos.org/centos/8/BaseOS/x86_64/os/Packages/kernel-modules-4.18.0-348.el8.x86_64.rpm
wget -y https://vault.centos.org/centos/8/BaseOS/x86_64/os/Packages/kernel-core-4.18.0-348.el8.x86_64.rpm
dnf remove -y kexec-tools
dnf remove -y ivtv-firmware
dnf remove -y linux-firmware
rpm -iv linux-firmware-20210702-103.gitd79c2677.el8.noarch.rpm
rpm -iv kernel-modules-4.18.0-348.el8.x86_64.rpm
rpm -iv --replacepkgs kernel-core-4.18.0-348.el8.x86_64.rpm
rpm -e --nodeps sysvinit-tools
rpm -q kernel-3.10.. and soft that depends on it
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync
wget -y http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/Packages/mariadb-connector-c-3.1.11-2.el8_3.x86_64.rpm
rpm -i –nodeps mariadb-connector-c-3.1.11-2.el8_3.x86_64.rpm
rpm -e dhclient
dnf -y remove dracut-network
rpm -y -e –nodeps sysvinit-tools
dnf  -y remove python36-rpmconf
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync
dnf -y install kernel-core
dnf -y groupupdate "Core" "Minimal Install"
rm -rf /etc/yum/protected.d
dnf -y install libvirt
dnf -y module install virt
dnf install -y virt-install virt-viewer libguestfs-tools
systemctl enable libvirtd.service
systemctl start libvirtd.service
rm -rf /etc/ssh/*.key
rm -rf /etc/ssh/*.pub
systemctl enable sshd
systemctl start sshd
dnf update -y —allowerasing
sudo dnf -y update
sudo dnf install centos-release-stream -y
sudo dnf swap centos-linux-repos centos-stream-repos -y
sudo dnf distro-sync -y
