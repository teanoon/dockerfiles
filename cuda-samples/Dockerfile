FROM nvidia/cuda:8.0-cudnn5-runtime-ubuntu14.04

ENV CUDA_PKG_VERSION 8-0

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-samples-$CUDA_PKG_VERSION && \
    rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/cuda/samples/1_Utilities/bandwidthTest && make
RUN cd /usr/local/cuda/samples/1_Utilities/deviceQuery && make
RUN cd /usr/local/cuda/samples/0_Simple/matrixMulCUBLAS && make
RUN cd /usr/local/cuda/samples/5_Simulations/nbody && make
RUN cd /usr/local/cuda/samples/0_Simple/vectorAdd && make
RUN ln -s /usr/local/cuda/samples/1_Utilities/bandwidthTest/bandwidthTest /usr/local/bin && \
    ln -s /usr/local/cuda/samples/1_Utilities/deviceQuery/deviceQuery /usr/local/bin && \
    ln -s /usr/local/cuda/samples/0_Simple/matrixMulCUBLAS/matrixMulCUBLAS /usr/local/bin && \
    ln -s /usr/local/cuda/samples/5_Simulations/nbody/nbody /usr/local/bin && \
    ln -s /usr/local/cuda/samples/0_Simple/vectorAdd/vectorAdd /usr/local/bin
