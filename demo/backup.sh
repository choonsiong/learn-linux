#!/bin/bash

m=$(date "+%m")
cd /var
tar czf - www | curl -T - --netrc-file pw.txt ftp://1.2.3.4/www-$m.tgz
mysqldump -u cms -pxxxx cms | curl -T - --netrc-file pw.txt ftp://1.2.3.4/cms-$m.sql