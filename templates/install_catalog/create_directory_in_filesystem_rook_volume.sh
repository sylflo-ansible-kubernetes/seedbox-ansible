#!/bin/bash

# Create the directory
mkdir /tmp/registry

# Detect the mon endpoints and the user secret for the connection
mon_endpoints=$(grep mon_host /etc/ceph/ceph.conf | awk '{print $3}')
my_secret=$(grep key /etc/ceph/keyring | awk '{print $3}')

# Mount the file system
mount -t ceph -o mds_namespace=myfs,name=admin,secret=$my_secret $mon_endpoints:/ /tmp/registry
cd /tmp/registry

mkdir -p seedbox/deluge/config
mkdir -p seedbox/deluge/data/Downloads
mkdir -p seedbox/deluge/data/TV
mkdir -p seedbox/deluge/data/Movies
mkdir -p seedbox/deluge/data/Musics

mkdir -p seedbox/heimdall/config

mkdir -p seedbox/jackett/config

mkdir -p seedbox/plex/config
mkdir -p seedbox/plex/transcode

mkdir -p seedbox/radarr/config

mkdir -p seedbox/seafile/shared

mkdir -p seedbox/sonarr/config

# Umount the registry folder and remove it
cd /
umount /tmp/registry
rmdir /tmp/registry
