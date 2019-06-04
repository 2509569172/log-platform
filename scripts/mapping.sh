

#curl -H 'content-type:application/json' -XPOST "http://192.168.3.132:9200/_aliases?pretty" -d '
#{
#	"actions":[
#		{
#			"add":{
#				"alias":"http-managent-alias",
#				"index":"http-managent"
#			}
#		}
#	]
#}'

#sleep 3

curl -XDELETE "http://192.168.3.132:9200/http-managent-v1?pretty"
curl -XPUT "http://192.168.3.132:9200/http-managent-v1?pretty"
curl -H 'content-type:application/json' -XPOST "http://192.168.3.132:9200/http-managent-v1/doc/_mapping?pretty" -d '
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
            "type" : "keyword",
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
curl -H 'content-type:application/json' -XPOST 'http://192.168.3.132:9200/_aliases?pretty' -d '
{
	"actions":[
		{
			"add":{
				"alias":"http-managent",
				"index":"http-managent-v1"
			}
		}
	]

}'

curl -XGET 'http://192.168.3.132:9200/_cat/indices?v'
#sleep 3

#curl -XDELETE "http://192.168.3.132:9200/http-managent?pretty"
