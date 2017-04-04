#!/bin/sh
export DB_URL=postgres://freshness:freshness@db:5432/freshness
cd /data/homes/freshness
docker run mcarans/hdx-data-freshness >> cron.log 2>&1
