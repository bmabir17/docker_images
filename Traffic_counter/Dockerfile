#Download base image ubuntu 16.04
#FROM ubuntu:16.04
#Download base image nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04
#FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

#Download base image bmabir17/cuda-opencv-nodejs:v1
FROM bmabir17/cuda-opencv-nodejs:v2

#FROM opencv-nodejs:v1
LABEL maintainer "bmabir17@gmail.com"
ENV OPENCV_VERSION 3.4.2

#update ubuntu Software repository
RUN apt-get update

####################
#Install Darknet-net
####################

#Install libwsclient
RUN git clone https://github.com/PTS93/libwsclient && \
    apt-get install -y libtool m4 automake && \
    cd libwsclient && \
    ./autogen.sh && \
    ./configure && make && make install && \
    cd /

#Install liblo
RUN wget https://github.com/radarsat1/liblo/releases/download/0.29/liblo-0.29.tar.gz --no-check-certificate && \
    tar xvfz liblo-0.29.tar.gz && \
    cd liblo-0.29 && \
    ./configure && make && make install && \
    cd /

#Install json-c
RUN git clone https://github.com/json-c/json-c.git && \
    cd json-c && \
    sh autogen.sh && \
    ./configure && make && make check && make install && \
    cd /
#Install darknet
RUN git clone https://github.com/meso-unimpressed/darknet-net.git && \
    cd darknet-net && \
    wget https://pjreddie.com/media/files/yolo-voc.weights --no-check-certificate && \
    make && \
    cd /

# Install pm2 and next globally
RUN npm i -g pm2 & \
    npm i -g next

#Clone ODC and configure
RUN git clone https://github.com/moovel/lab-open-data-cam.git # && \
    cd lab-open-data-cam && \
    echo '{"PATH_TO_YOLO_DARKNET":"/darknet-net"}' > config.json && \
 #Start ODC server
    npm install && \
    npm run build && \



