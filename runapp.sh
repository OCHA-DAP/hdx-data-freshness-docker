#!/bin/sh
sudo cp /dev/null $(docker inspect -f '{{.LogPath}}' hdxdatafreshnessdocker_app_1)
cd /data/homes/freshness/hdx-data-freshness-docker
docker-compose start app

