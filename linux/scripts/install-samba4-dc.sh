#!/bin/bash -xe

SAMBAVER=4.10.9
SAMBALIBSVER=4.8.3*

# Instal EPEL repo
source /etc/os-release
if [ "$PRETTY_NAME" == "Amazon Linux 2" ]; then
   amazon-linux-extras install -y epel
fi

# Install dependencies to build Samba 4 AD
yum install -y "@Development Tools"
yum install -y attr bind-utils docbook-style-xsl gcc gdb krb5-workstation \ 
    libsemanage-python libxslt perl perl-ExtUtils-MakeMaker \
    perl-Parse-Yapp perl-Test-Base pkgconfig policycoreutils-python \
    python2-crypto gnutls-devel libattr-devel keyutils-libs-devel \
    libacl-devel libaio-devel libblkid-devel libxml2-devel openldap-devel \
    pam-devel popt-devel python-devel readline-devel zlib-devel systemd-devel \
    lmdb-devel jansson-devel gpgme-devel pygpgme libarchive-devel python3 python2 \
    krb5-devel python3-devel iniparser libldb libtalloc libtdb libtevent cups-devel

# Download Samba 4 source
cd /tmp/
if [ ! -f /opt/scripts/domain-controller/samba-$SAMBAVER.tar.gz ]; then
    curl -O https://download.samba.org/pub/samba/stable/samba-$SAMBAVER.tar.gz
fi

# Untar
tar -xf /tmp/samba-$SAMBAVER.tar.gz

# Compile and install Samba 4 with DC support
cd /tmp/samba-$SAMBAVER
./configure \
    --enable-fhs \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --systemd-install-services
make && make install

# Install samba-libs to ensure that samba-tool will work
yum install -y samba-libs-$SAMBALIBSVER*

# Clean temporary files
#rm -rf /tmp/samba-$SAMBAVER/
#rm -rf /tmp/samba-$SAMBAVER.tar.gz
