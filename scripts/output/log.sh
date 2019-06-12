#!/bin/bash

curl -H 'content-type:application/json' -XGET 'http://120.77.178.98:9200/mqtt-server/_search?pretty' >> ./log.json
