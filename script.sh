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
