/usr/local/work/log/kafka/bin/zookeeper-server-start.sh /usr/local/work/log/kafka/config/zookeeper.properties &
sleep 3
/usr/local/work/log/kafka/bin/kafka-server-start.sh /usr/local/work/log/kafka/config/server.properties &
