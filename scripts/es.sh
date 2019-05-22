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

#----------------------------------------------
# - - - - - -  running function - - - - - - 
#----------------------------------------------

#findByPage "http-managent"

#findIndex "http://192.168.3.132:9200"

#findIndex "http://120.77.178.98:9200"

#sortIndex "mqtt-server" "http://120.77.178.98:9200"

findIndexAll "node-exporter" "http://192.168.3.132:9200"
