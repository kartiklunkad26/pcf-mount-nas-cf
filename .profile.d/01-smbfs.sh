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
#mkdir ~/.smb
#cp -R ~/app/.smb/* ~/.smb/
#chmod 600 ~/.smb/smbnetfs.conf
#chmod 600 ~/.smb/smb.conf
#chmod 600 ~/.smb/smbnetfs.auth
/app/local/smbnetfs  /app/mnt -o config=/app/smbnetfs.cf,log_file=/tmp/smbnetfs.log 
sleep 3
rm -fr /app/storage
ln -s /app/mnt/WORKGROUP/FREENAS/CIFSShare /app/storage
