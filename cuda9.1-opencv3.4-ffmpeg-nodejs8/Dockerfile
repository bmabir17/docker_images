#Download base image ubuntu 16.04
#FROM ubuntu:16.04
#Download base image nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04
FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

LABEL maintainer "bmabir17@gmail.com"
ENV OPENCV_VERSION 3.4.2

#update ubuntu Software repository
RUN apt-get update
RUN apt-get install -y software-properties-common

#Install cURL
RUN apt-get install curl

#Install git-core
RUN apt-get install git-core -y

#Install nodejs(v8)
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential


#Install ffmpeg(v3)
RUN add-apt-repository ppa:jonathonf/ffmpeg-3
# RUN add-apt-repository ppa:jonathonf/tesseract (ubuntu 14.04 only!!)
RUN apt update && apt upgrade -y
RUN apt-get install ffmpeg -y

#Install nano
RUN apt-get install nano

# Install all dependencies for OpenCV
RUN apt-get -y update && \
    apt-get -y install \
        python3 \
        python3-dev \
        git \
        wget \
        unzip \
        cmake \
        build-essential \
        pkg-config \
        libatlas-base-dev \
        gfortran \
        libjasper-dev \
        libgtk2.0-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libv4l-dev \
    && \

# install python dependencies
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    pip3 install numpy \
    && \

# Get OpenCV
    wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip -O opencv3.zip && \
    unzip -q opencv3.zip && \
    mv /opencv-$OPENCV_VERSION /opencv && \
    rm opencv3.zip && \
    wget https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip -O opencv_contrib3.zip && \
    unzip -q opencv_contrib3.zip && \
    mv /opencv_contrib-$OPENCV_VERSION /opencv_contrib && \
    rm opencv_contrib3.zip \
    && \

# Prepare build for opencv
    mkdir /opencv/build && cd /opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D BUILD_PYTHON_SUPPORT=ON \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
      -D BUILD_EXAMPLES=OFF \
      -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3 \
      -D BUILD_opencv_python3=ON \
      -D BUILD_opencv_python2=OFF \
      -D WITH_IPP=OFF \
      -D WITH_FFMPEG=ON \
      -D WITH_CUDA=ON \
      -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 \
      -D WITH_CUBLAS=ON \
      -D WITH_V4L=ON .. \
    && \

# Install opencv
    cd /opencv/build && \
    make -j$(nproc) && \
    make install && \
    ldconfig \
    && \

# Clean
   apt-get -y remove \
        python3-dev \
        libatlas-base-dev \
        gfortran \
        libjasper-dev \
        libgtk2.0-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper-dev \
        libv4l-dev \
    && \
    apt-get clean && \
    rm -rf /opencv /opencv_contrib /var/lib/apt/lists/*