#!/bin/bash

# Add Etcher repo
wget https://etcher.io/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo 

# Etcher install
yum install -y etcher-electron
