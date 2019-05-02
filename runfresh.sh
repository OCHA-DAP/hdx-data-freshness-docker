#!/bin/sh

basedir=/data/freshness
projdir=$basedir/stack
doco=/usr/local/bin/docker-compose
cname=freshness_fresh_1

sudo cp /dev/null $(docker inspect -f '{{.LogPath}}' $cname)
cd $projdir
$doco run --rm fresh
