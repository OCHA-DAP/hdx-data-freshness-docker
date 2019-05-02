#!/bin/sh

today=$(date +%Y%m%d-%H%M%S)
cname=db
projdir=/data/freshness/stack
logdir=/data/freshness/log
logbasefname=crondbbackup
basedir=/backup
docoex=/usr/local/bin/docker-compose exec -T

# backup
cd $projdir
$docoex $cname sh -c "cd /$basedir; pg_dump -vFt -U postgres -f $today.pgsql freshness"

if [ "$?" -ne "0" ]; then
    echo "Database dump errored out. Removing the dump and exiting early."
    $docoex $cname sh -c "cd /$basedir; rm -f $today.pgsql"
    exit 1
fi

echo "Compressing the database dump..."
$docoex $cname sh -c "cd /$basedir; gzip $today.pgsql"

echo "Copying this log file to a timestamped logfile..."
cp -a $logdir/$logbasefname.log $logdir/$logbasefname.$today.log

# sync
#rsync -av /data/homes/freshness/freshness-db/*.psql.gz DSTIP:/DST/FOLDER/
