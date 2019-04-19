#!/bin/bash

indexs=` curl -X GET 'http://192.168.3.132:9200/_cat/indices?v' | awk '{print $3}' | grep -vE '(kibana|index|watcher|monitoring)'`

for index in $indexs
do
curl -X POST "http://192.168.3.132:9200/$index/_delete_by_query?pretty" -H 'content-type:application/json' -d '
{
  "query":{
      "bool":{
         "must":[{
             "range":{
                "@timestamp":{
                    "lte":"now-30d",
		     "format":"epoch_millis"
                   }
                }
              }],
            "must_not":[]
           }
       }
}'
echo "already delete $index 3-days old data" >> /usr/local/work/log/clear.log
done
