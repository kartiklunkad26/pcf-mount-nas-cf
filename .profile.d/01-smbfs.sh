#!/bin/bash
mkdir -p /app/local
rm -rf /app/mnt
mkdir -p /app/mnt
cp /app/libs/smbnetfs /app/local
for i in /app/libs/*.deb
do
    dpkg -x $i /app/local
done

LD_LIBRARY_PATH=/app/local/usr/lib/x86_64-linux-gnu:/app/local/usr/lib/x86_64-linux-gnu/samba
export LD_LIBRARY_PATH
chmod 600 /app/smbnetfs.cf
/app/local/smbnetfs  /app/mnt -o config=/app/smbnetfs.cf
sleep 3
rm -fr /app/storage
ln -s /app/mnt/$IP_ADDR/CIFSShare /app/storage
