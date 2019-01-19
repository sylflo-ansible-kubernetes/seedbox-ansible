#!/bin/bash

# Create the directory
mkdir /tmp/registry

# Detect the mon endpoints and the user secret for the connection
mon_endpoints=$(grep mon_host /etc/ceph/ceph.conf | awk '{print $3}')
my_secret=$(grep key /etc/ceph/keyring | awk '{print $3}')

# Mount the file system
mount -t ceph -o mds_namespace=myfs,name=admin,secret=$my_secret $mon_endpoints:/ /tmp/registry
cd /tmp/registry

echo "FORCE_HTTPS=true" >> seedbox/heimdall/config/www/.env

# Umount the registry folder and remove it
cd /
umount /tmp/registry
rmdir /tmp/registry
