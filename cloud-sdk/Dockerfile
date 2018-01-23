FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential wget ca-certificates \
    python python-dev python3 python3-dev && \
    rm -rf /var/lib/apt/lists/*

ARG GOOGLE_CLOUD_SDK_VERSION=185.0.0
ARG GOOGLE_CLOUD_SDK_FILE_NAME=google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz
ARG GOOGLE_CLOUD_SDK_FILE_CHECKSUM=407c7318f25435ebd32cf12bf536da501786aa3095da406eab240e5e936202bb
ENV PATH="/google-cloud-sdk/bin:/home/dev/.local/bin:${PATH}"
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GOOGLE_CLOUD_SDK_FILE_NAME} && \
    echo "${GOOGLE_CLOUD_SDK_FILE_CHECKSUM} ${GOOGLE_CLOUD_SDK_FILE_NAME}" > ${GOOGLE_CLOUD_SDK_FILE_NAME}.txt && \
    sha256sum -c ${GOOGLE_CLOUD_SDK_FILE_NAME}.txt && \
    tar -xzf ${GOOGLE_CLOUD_SDK_FILE_NAME} && rm ${GOOGLE_CLOUD_SDK_FILE_NAME}

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN useradd -m dev && mkdir /code && \
    chown dev:dev /code -R && \
    chown dev:dev /google-cloud-sdk -R

USER dev
RUN ./google-cloud-sdk/install.sh

WORKDIR /code
