#!/bin/bash

updateMapping(){
	#index=http-managent
	index=$1

	curl -X POST "http://192.168.3.132:9200/$index/_close?pretty"

	sleep 3
	curl -H 'content-type:application/json' -XPUT "http://192.168.3.132:9200/$index/_settings?pretty" -d ' 
	{
 	"analysis":{
   		"analyzer":{
      		"default":{
        		"type":"keyword"
       	 	}
    	     }
 	   }
	}'
	
	sleep 3
	curl -X POST "http://192.168.3.132:9200/$index/_open?pretty"
}


findByPage(){
	index=$1

	curl -H 'content-type:application/json' -XGET "http://192.168.3.132:9200/$index/_search?pretty" -d '
	{
		"query":{
                  "bool":{
                    "should":[{"wildcard":{"msg":"*hosts set*"}}]
		   }
                }
	}'
}



findIndex(){
	url=$1
	
	curl -XGET "$url/_cat/indices?v"
}



# sort asc/desc
sortIndex(){
	index=$1
	url=$2
	curl -H 'content-type:application/json' -XGET "$url/$index/_search?pretty" -d '
        {
		"size":1,
		"sort":[{"@timestamp":"asc"}]
	}'
}


findIndexAll(){
	index=$1
	url=$2
	curl -H 'content-type:application/json' -XGET "$url/$index/_search?pretty"
}

getMapping(){
	index=$1
	url=$2
	curl -H 'content-type:application/json' -XGET "$url/$index/_mapping?pretty"
}

setMapping(){
	index=$1
	url=$2
	curl -X POST "http://192.168.3.132:9200/$index/_close?pretty"
	sleep 3
	curl -H 'content-type:application/json' -XPOST "$url/$index/doc/_mapping?pretty" -d '
	{
      "doc" : {
        "properties" : {
          "@timestamp" : {
 	    "type" : "date",
	    "format":"yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis||strict_date_optional_time"
          },
          "classline" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "ip" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "level" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "logdate" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "msg" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "process" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "src" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "thread" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          },
          "type" : {
            "type" : "text",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          }
        }
      }
    }
'
sleep 3
curl -X POST "http://192.168.3.132:9200/$index/_open?pretty"
}

#----------------------------------------------
# - - - - - -  running function - - - - - - 
#----------------------------------------------

#findByPage "http-managent"

#findIndex "http://192.168.3.132:9200"

#findIndex "http://120.77.178.98:9200"

#sortIndex "mqtt-server" "http://120.77.178.98:9200"

#findIndexAll "node-exporter" "http://192.168.3.132:9200"

setMapping "http-managent" "http://192.168.3.132:9200"
getMapping "http-managent" "http://192.168.3.132:9200"

