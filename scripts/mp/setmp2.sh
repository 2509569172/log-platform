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
          }
        }
      }
    }'
}

setalias() {
url=$1
curl -XDELETE "$url/mqtt-server?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-server",
                                "index":"mqtt-server-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/http-server?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"http-server",
                                "index":"http-server-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/sip-server?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"sip-server",
                                "index":"sip-server-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/rtp-server?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"rtp-server",
                                "index":"rtp-server-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/mqtt-client-junit?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-client-junit",
                                "index":"mqtt-client-junit-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/mqtt-auth?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-auth",
                                "index":"mqtt-auth-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/http-managent?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
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

curl -XDELETE "$url/mqtt-message?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-message",
                                "index":"mqtt-message-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/http-memenet?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"http-memenet",
                                "index":"http-memenet-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/mqtt-apidao?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-apidao",
                                "index":"mqtt-apidao-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/mqtt-publish?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-publish",
                                "index":"mqtt-publish-v1"
                        }
                }
        ]

}'

curl -XDELETE "$url/mqtt-job?pretty"
curl -H 'content-type:application/json' -XPOST "$url/_aliases?pretty" -d '
{
        "actions":[
                {
                        "add":{
                                "alias":"mqtt-job",
                                "index":"mqtt-job-v1"
                        }
                }
        ]

}'
}

setmapping "http-managent-v1" "http://192.168.3.132:9200"
setmapping "http-memenet-v1" "http://192.168.3.132:9200"
setmapping "http-server-v1" "http://192.168.3.132:9200"
setmapping "mqtt-apidao-v1" "http://192.168.3.132:9200"
setmapping "mqtt-auth-v1" "http://192.168.3.132:9200"
setmapping "mqtt-client-junit-v1" "http://192.168.3.132:9200"
setmapping "mqtt-job-v1" "http://192.168.3.132:9200"
setmapping "mqtt-message-v1" "http://192.168.3.132:9200"
setmapping "mqtt-publish-v1" "http://192.168.3.132:9200"
setmapping "mqtt-server-v1" "http://192.168.3.132:9200"
setmapping "rtp-server-v1" "http://192.168.3.132:9200"
setmapping "sip-server-v1" "http://192.168.3.132:9200"

setalias "http://192.168.3.132:9200"

curl -XGET 'http://192.168.3.132:9200/_cat/indices?v'
