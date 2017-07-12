FROM openjdk:8u131

RUN wget http://www-us.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz -O hadoop.tar.gz && \
    wget https://dist.apache.org/repos/dist/release/hadoop/common/KEYS && \
    wget https://dist.apache.org/repos/dist/release/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz.asc -O hadoop.tar.gz.asc && \
    gpg --import KEYS && \
    gpg --verify hadoop.tar.gz.asc && \
    tar xf hadoop.tar.gz && \
    rm hadoop.tar.gz hadoop.tar.gz.asc KEYS && \
    mv hadoop-2.7.3 hadoop

ADD boot.sh /hadoop
WORKDIR /hadoop
