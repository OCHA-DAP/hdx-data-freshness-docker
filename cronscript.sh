#!/bin/sh
cd /data/homes/freshness
docker exec "echo hi" >> cron.log 2>&1
