#!/bin/bash
curl -H 'content-type:application/json' -XGET 'http://120.77.178.98:9200/mqtt-server/_search?pretty' -d '
{
   "query":{
      "bool":{
        "must":[
          {"range":{
            "@timestamp":{
               "lte":"2019-06-06",
             "gte":"2019-06-05"
            }
         }
        },
        {"wildcard":{"msg":"*openLock*"}}
        ]
      }
     },
   "size":10000,
   "sort":{"@timestamp":"asc"}
}' >> output.log
