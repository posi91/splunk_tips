#!/bin/bash
# Nota: Tenga en cuenta que el addon debe de estar instalado.
# Testing: Splunk 7.3 y 7.2, OS Debian 10 y Ubuntu Server 18.04 LTS 

# Push git repository
git clone https://github.com/posi91/splunk_tips.git
cd splunk_tips
rm -rf /opt/splunk/etc/apps/Splunk_TA_checkpoint-opseclea/bin/opsec-tools/*
cp ./opsec_lea/opsec-tools/opsec_pu* /opt/splunk/etc/apps/Splunk_TA_checkpoint-opseclea/bin/opsec-tools/
dpkg --add-architecture i386
apt update
apt -y install libpam-modules:i386 libc6:i386 libpam0g:i386 lib32stdc++6 git
# Crear enlace simbolico
ln -s /opt/splunk/etc/apps/Splunk_TA_checkpoint-opseclea/bin/libcpc++-libc6.1-2.so.3 /lib
# restart splunk
/opt/splunk/bin/splunk restart
