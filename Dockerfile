FROM sequenceiq/spark:1.5.1
MAINTAINER Zhong shigang zhongshigang@gmail.com

RUN yum -y update && yum -y install java-1.8.0-openjdk.x86_64 \
    git \
    npm \
    libfontconfig.so.1 

ENV MAVEN_VERSION 3.3.3

RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz | tar -xz -C /usr/share \
  && mv /usr/share/apache-maven-3.3.3 /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
  
ENV MAVEN_HOME /usr/share/maven

RUN git clone https://github.com/apache/incubator-zeppelin.git \
  && cd incubator-zeppelin \
  && mvn clean package -Pspark-1.5 \
        -Dhadoop.version=2.6.0 \
        -Phadoop-2.6 \
        -Pyarn \
        -DskipTests

EXPOSE 8080 8081

RUN ln -s /incubator-zeppelin/bin/zeppelin-daemon.sh /usr/bin/zeppelin

CMD ["zeppelin","start"] 
