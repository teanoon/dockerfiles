FROM openjdk:8

ARG HADOOP_VERSION=2.9.0
ARG DIST_URL=https://dist.apache.org/repos/dist/release/hadoop/common
RUN curl -O ${DIST_URL}/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    curl -O ${DIST_URL}/KEYS && \
    curl -O ${DIST_URL}/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz.asc && \
    gpg --import KEYS && \
    gpg --verify hadoop-${HADOOP_VERSION}.tar.gz.asc && \
    tar xf hadoop-${HADOOP_VERSION}.tar.gz && \
    rm hadoop-${HADOOP_VERSION}.tar.gz hadoop-${HADOOP_VERSION}.tar.gz.asc KEYS && \
    mv hadoop-${HADOOP_VERSION} hadoop

ADD boot.sh /hadoop
WORKDIR /hadoop
