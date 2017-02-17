FROM nvidia/cuda:8.0-cudnn5-runtime-ubuntu14.04

# install libcupti-dev from multiverse repo
COPY ./nvidia-375 /usr/lib/nvidia-375
RUN mkdir /usr/lib/nvidia && \
    sed -i '/^deb\shttp\:\/\/archive\.ubuntu\.com\/ubuntu\/\strusty\smain\srestricted/ s/restricted/restricted multiverse/' /etc/apt/sources.list && \
    apt-get update && \
    # install basic requirements
    apt-get install -y --no-install-recommends \
    software-properties-common htop vim git openssh-client zsh tmux wget curl w3m less libcupti-dev && \

    # install java bazel
    add-apt-repository ppa:webupd8team/java && \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add - && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    oracle-java8-installer oracle-java8-set-default && \
    apt-get install -y bazel \

    # install python
    python3-dev python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip3 install six numpy wheel

RUN mkdir /tensorflow && \
    git clone -b r1.0 https://github.com/tensorflow/tensorflow.git /tensorflow && \
    cd /tensorflow && \
    export PYTHON_BIN_PATH=$(which python3) && echo $PYTHON_BIN_PATH && \
    export CC_OPT_FLAGS="-march=native" && \
    export TF_NEED_JEMALLOC=1 && \
    export TF_NEED_GCP=0 && \
    export TF_NEED_HDFS=0 && \
    export TF_ENABLE_XLA=0 && \
    export TF_NEED_OPENCL=0 && \
    export TF_NEED_CUDA=0 && \
    export GCC_HOST_COMPILER_PATH=$(which gcc) && \
    export TF_CUDA_VERSION=8.0 && \
    export CUDA_TOOLKIT_PATH=/usr/local/cuda && \
    export CUDNN_INSTALL_PATH=/usr/local/cuda && \
    export TF_CUDNN_VERSION=5 && \
    export TF_CUDA_COMPUTE_CAPABILITIES=3.0 && \
    ./configure && \
    bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg && \
    pip3 install /tmp/tensorflow_pkg/tensorflow-1.0.0-cp34-cp34m-linux_x86_64.whl && \
    bazel clean && \
    rm /tensorflow -rf
