#!/bin/bash

# https://stackoverflow.com/a/185473/1388019
lockfile="/tmp/duplicacy.lock"

if [ -e ${lockfile} ] && kill -0 `cat ${lockfile}`; then
    echo "duplicacy already running"
    exit
fi

# make sure the lockfile is removed when we exit and then claim it
trap "rm -f ${lockfile}; exit" INT TERM EXIT
echo $$ > ${lockfile}

# run the backup with default settings
cd /data/duplicacy
/apps/duplicacy/bin/duplicacy -log backup -threads 4

# clean up lockfile
rm -f ${lockfile}
