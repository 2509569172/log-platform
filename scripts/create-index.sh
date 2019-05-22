#!/bin/bash

indexs=('http-managent' 'http-memenet' 'http-server' 'mqtt-apidao' 'mqtt-auth' 'mqtt-client-junit' 'mqtt-job' 'mqtt-message' 'mqtt-publish' 'mqtt-server' 'rtp-server' 'sip-server')

#indexs[0]='http-managent'
#indexs[1]='http-memenet'
#indexs[2]='http-server'
#indexs[3]='mqtt-apidao'
#indexs[4]='mqtt-auth'
#indexs[5]='mqtt-client-junit'
#indexs[6]='mqtt-job'
#indexs[7]='mqtt-message'
#indexs[8]='mqtt-publish'
#indexs[9]='mqtt-server'
#indexs[10]='rtp-server'
#indexs[11]='sip-server'

echo $indexs

for index in ${indexs[*]}
do
curl -XPUT "http://192.168.3.132:9200/$index?pretty" -H 'content-type:application/json' -d '
{
  "analysis":{
    "analyzer":{
       "default":{
          "type":"keyword"
        }
     }
  }
}'
echo "created index : [$index]" >> /usr/local/work/log/create-index.log
done

