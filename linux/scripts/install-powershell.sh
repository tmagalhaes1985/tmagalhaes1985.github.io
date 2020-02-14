# !/bin/bash
# Register the Microsoft Red Hat repository
wget https://packages.microsoft.com/config/rhel/7/prod.repo -O /etc/yum.repos.d/microsoft.repo

# Install PowerShell
yum install -y powershell
