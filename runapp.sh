#!/bin/sh
cp /dev/null $(docker inspect -f '{{.LogPath}}' hdxdatafreshnessdocker_app_1)
cd /data/homes/freshness
docker run --env-file hdx-data-freshness-docker/.env mcarans/hdx-data-freshness > cron.log 2>&1

