#!/bin/bash

datas=` curl -X GET 'http://120.77.178.98:9200/_cat/indices?v' | awk '{print $3","$9}' | grep -vE '(store.size|index)'`

for data in $datas
do
	str=${data//,/ }
	arr=($str)
	
	if [[ ${arr[1]} =~ "gb" ]];then
		echo "${arr[0]}:${arr[1]}"
		val=${arr[1]}
		vall=${val%g*}
	
		num=`echo $vall|awk '{print int($0)}'`	
		#echo "num:$num"
		if [ $num -ge 1 ];then
			echo "${arr[0]}-$vall"
		fi
	fi

done


