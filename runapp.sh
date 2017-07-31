#!/bin/sh
sudo cp /dev/null $(docker inspect -f '{{.LogPath}}' hdxdatafreshnessdocker_fresh_1)
sudo cp /dev/null $(docker inspect -f '{{.LogPath}}' hdxdatafreshnessdocker_email_1)
cd /data/homes/freshness/hdx-data-freshness-docker
/usr/local/bin/docker-compose start fresh
/usr/local/bin/docker-compose start email

