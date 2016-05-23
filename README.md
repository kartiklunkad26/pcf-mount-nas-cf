# Mount a CIFS Share on NAS with Cloud Foundry Apps
This repository will provide a way to mount a CIFS Share on NAS with Cloud Foundry Apps. It uses smbnetfs library for the mount.
## Description
The repo contains a sample JSP application, a script in profile.d directory (to mount the share), smbnetfs auth file (to authorize the connection) and the libraries required for the smbnetfs binary. 

## Instructions to use
* Replace the $IP_ADDR with your NAS IP in the 01-smbfs.sh
* Replace the $IP_ADDR, $SHARE_NAME, $USERNAME, $PASSWORD to login to the share in smbnetfs.cf
* cf push the application folder 
* app/storage will be the places where the application can search for the content of the share. 

## Example
* Find below example changes for smbnetfs.cf. 
##
`auth 10.68.147.253/CIFSShare root freenas`

* Find below example changes for 01-smbfs.sh
##
`ln -s /app/mnt/10.68.147.253/CIFSShare /app/storage`
