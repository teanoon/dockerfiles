FROM openjdk:8u131

RUN wget http://www-us.apache.org/dist/spark/spark-2.1.1/spark-2.1.1-bin-hadoop2.7.tgz -O spark-bin.tgz && \
    wget https://www.apache.org/dist/spark/spark-2.1.1/spark-2.1.1-bin-hadoop2.7.tgz.asc -O spark-bin.tgz.asc && \
    wget https://www.apache.org/dist/spark/KEYS && \
    gpg --import KEYS && \
    gpg --verify spark-bin.tgz.asc && \
    tar xf spark-bin.tgz && \
    rm spark-bin.tgz spark-bin.tgz.asc KEYS && \
    mv spark-2.1.1-bin-hadoop2.7 spark-bin

WORKDIR /spark-bin
