setmapping() {
        index2=$1
        url=$2

curl -XDELETE "$url/$index2?pretty"
curl -XPUT "$url/$index2?pretty"
curl -H 'content-type:application/json' -XPOST "$url/$index2/doc/_mapping?pretty" -d '
{
      "doc" : {
        "properties" : {
          "@timestamp" : {
            "type" : "date"
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
          },
		  "rtpid" : {
            "type" : "keyword",
            "fields" : {
              "keyword" : {
                "type" : "keyword",
                "ignore_above" : 256
              }
            }
          }
        }
      }
    }'
}

setalias() {
url=$1

curl -XDELETE "$url/rtp-process?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"rtp-process",
                                "index":"rtp-process-v1"
                        }
                }
        ]

}'
}

setmapping "rtp-process-v1" "http://192.168.3.132:9200"

setalias "http://192.168.3.132:9200"

curl -XGET 'http://192.168.3.132:9200/_cat/indices?v'

