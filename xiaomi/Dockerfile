FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y --force-yes wget unzip build-essential autoconf libtool libssl-dev && \
    apt-get clean

ADD sdk_package /sdk_package

ENV PATH=$PATH:/sdk_package/toolchain/bin
ENV CC=mipsel-xiaomi-linux-uclibc-gcc
ENV CXX=mipsel-xiaomi-linux-uclibc-g++
ENV AR=mipsel-xiaomi-linux-uclibc-ar
ENV RANLIB=mipsel-xiaomi-linux-uclibc-ranlib

RUN wget http://downloads.sourceforge.net/project/libpng/zlib/1.2.8/zlib-1.2.8.tar.gz && \
    tar -xf zlib-1.2.8.tar.gz && \
    mkdir zlib && cd zlib-1.2.8 && \
    ./configure --prefix=/zlib && \
    make && make install && \
    cd / && rm zlib-1.2.8.tar.gz zlib-1.2.8 -rf

RUN wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_1t.zip && \
    unzip OpenSSL_1_0_1t.zip && \
    mkdir openssl && cd openssl-OpenSSL_1_0_1t && \
    ./config --prefix=/openssl no-asm no-shared os/compiler:mipsel-xiaomi-linux-uclibc-gcc && \
    make && make install && \
    cd / && rm OpenSSL_1_0_1t.zip openssl-OpenSSL_1_0_1t -rf

ADD shadowsocks-libev shadowsocks-libev
RUN mkdir shadowsocks && cd shadowsocks-libev && \
    ./autogen.sh

RUN wget https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz && \
    tar -xf pcre-8.41.tar.gz
RUN mkdir pcre && cd pcre-8.41 && \
    ./configure --host=mipsel-xiaomi-linux-uclibc --prefix=/pcre && \
    make && make install
RUN wget https://tls.mbed.org/download/mbedtls-2.6.0-gpl.tgz && \
    tar -zvxf mbedtls-2.6.0-gpl.tgz
RUN mkdir mbedtls && cd mbedtls-2.6.0 && \
    make && make DESTDIR=/mbedtls install

RUN wget https://github.com/jedisct1/libsodium/releases/download/1.0.13/libsodium-1.0.13.tar.gz && \
    tar -xf libsodium-1.0.13.tar.gz && \
    mkdir libsodium && cd libsodium-1.0.13 && \
    ./autogen.sh && \
    ./configure --prefix=/libsodium --host=mipsel-xiaomi-linux-uclibc && \
    make && make install

RUN wget https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz && \
    tar -xf c-ares-1.13.0.tar.gz
RUN mkdir cares && cd c-ares-1.13.0 && \
    ./configure --prefix=/cares --host=mipsel-xiaomi-linux-uclibc && \
    make && make install

# RUN cd /shadowsocks-libev && \
#    ./configure --prefix=/shadowsocks --with-pcre=/pcre --with-mbedtls=/mbedtls --with-sodium=/libsodium --host=mipsel-xiaomi-linux-uclibc --disable-ssp --disable-documentation && \
#    make && make install && \
#    cd / && rm shadowsocks-libev -rf
