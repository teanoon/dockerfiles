FROM openjdk:8

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates && \
    rm /var/lib/apt/lists/* -rf

ARG SPARK_VERSION=2.2.1
RUN curl -OL http://muug.ca/mirror/apache-dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    curl -OL https://www.apache.org/dist/spark/KEYS && \
    curl -OL https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz.asc && \
    gpg --import KEYS && \
    gpg --verify spark-${SPARK_VERSION}-bin-hadoop2.7.tgz.asc spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    tar zxf spark-${SPARK_VERSION}-bin-hadoop2.7.tgz && \
    rm KEYS spark-${SPARK_VERSION}-bin-hadoop2.7.tgz spark-${SPARK_VERSION}-bin-hadoop2.7.tgz.asc && \
    mv spark-${SPARK_VERSION}-bin-hadoop2.7 spark-bin

RUN useradd -m -u 1000 dev && \
    chown dev:dev /spark-bin -R

WORKDIR /spark-bin
CMD /spark-bin/bin/spark-shell
