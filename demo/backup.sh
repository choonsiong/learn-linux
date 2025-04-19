#!/bin/bash

# cron job
# 15 3 * * 0 root /home/foobar/bin/backup.sh

m=$(date "+%m")
cd /var
# the archive is redirected to the curl command using |
# curl transfer the data to an ftp server
tar czf - www | curl -T - --netrc-file pw.txt ftp://1.2.3.4/www-$m.tgz
mysqldump -u cms -pxxxx cms | curl -T - --netrc-file pw.txt ftp://1.2.3.4/cms-$m.sql