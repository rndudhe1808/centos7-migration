yum -y update && yum -y upgrade 
yum install epel-release -y
yum -y install rpmconf  yum-utils
rpmconf -a
package-cleanup --leaves; package-cleanup --orphans
yum -y install dnf
dnf -y remove yum yum-metadata-parser
rm -Rf /etc/yum
dnf -y update
dnf install -y  http://vault.centos.org/8.5.2111/BaseOS/x86_64/os/Packages/{centos-linux-repos-8-3.el8.noarch.rpm,centos-linux-release-8.5-1.2111.el8.noarch.rpm,centos-gpg-keys-8-3.el8.noarch.rpm}
dnf -y upgrade https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf clean all
rpm -e `rpm -q kernel`; rpm -e --nodeps sysvinit-tools
dnf -y --releasever=8 --allowerasing --setopt=deltarpm=false distro-sync
dnf -y install kernel-core kernel
dnf install grub2 -y
dnf update -y
dnf install centos-release-stream -y
dnf swap centos-{linux,stream}-repos -y
dnf -y update
sudo dnf distro-sync
