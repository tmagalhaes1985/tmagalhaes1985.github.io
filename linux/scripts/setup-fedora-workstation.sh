# !/bin/bash

# Add UnitedRPMs GPG keys
rpm --import https://raw.githubusercontent.com/UnitedRPMs/unitedrpms/master/URPMS-GPG-PUBLICKEY-Fedora-24

# Install UnitedRPMs repo
dnf -y install https://github.com/UnitedRPMs/unitedrpms/releases/download/11/unitedrpms-$(rpm -E %fedora)-11.fc$(rpm -E %fedora).noarch.rpm

# Install RPM Fusion repo
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Install multi-purpose workstation applications
dnf -y groupinstall "Development Tools"
dnf -y install fedora-workstation-repositories
