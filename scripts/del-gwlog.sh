#!/bin/bash
location="/usr/local/work/log/test/del-test/"
find $location -mtime +3 -type f |xargs rm -f
