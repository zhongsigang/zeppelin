# zeppelin
sequenceiq/spark:1.5.1 + zeppelin

memo:

docker run -it -p 8080:8080 -p 8081:8081 zeppelin /bin/bash
zeppelin start

https://hub.docker.com/r/sequenceiq/hadoop-docker/
CMD ["/etc/bootstrap.sh", "-d"]
docker run -it sequenceiq/hadoop-docker:2.7.0 /etc/bootstrap.sh -bash
  hdfs:50010 50020 50070 50075 50090
  Yarn:8030 8031 8032 8033 8040 8042 8088  
Mapred:19888 Other:49707 2122
 
https://hub.docker.com/r/sequenceiq/spark/  from sequenceiq/hadoop-docker:2.6.0
ENTRYPOINT ["/etc/bootstrap.sh"]
docker run -it -p 8088:8088 -p 8042:8042 -h sandbox sequenceiq/spark:1.5.1 bash
spark-shell \
--master yarn-client \
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1
spark-submit \
--class org.apache.spark.examples.SparkPi \
--files $SPARK_HOME/conf/metrics.properties \
--master yarn-cluster \
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1 \
$SPARK_HOME/lib/spark-examples-1.5.1-hadoop2.6.0.jar
spark-submit \
--class org.apache.spark.examples.SparkPi \
--master yarn-client \
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1 \
$SPARK_HOME/lib/spark-examples-1.5.1-hadoop2.6.0.jar

http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html
http://spark.apache.org/docs/latest/running-on-yarn.html
http://spark.apache.org/docs/latest/spark-standalone.html

https://hub.docker.com/r/epahomov/docker-zeppelin/
docker run -i -t -p 8080:8080 -p 8081:8081 epahomov/docker-zeppelin /bin/bash

https://github.com/apache/incubator-zeppelin
