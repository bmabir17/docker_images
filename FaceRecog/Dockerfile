#Download base image ubuntu 16.04
#FROM ubuntu:16.04
#Download base image nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04
#FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

#Download base image bmabir17/cuda-opencv-nodejs:v1
FROM bmabir17/cuda-opencv-nodejs:v1

LABEL maintainer "bmabir17@gmail.com"
ENV OPENCV_VERSION 3.4.2

#update ubuntu Software repository
RUN apt-get update


#Dlib Installation
RUN apt-get install libopenblas-dev liblapack-dev -y
RUN apt-get install libx11-dev libgtk-3-dev -y
RUN pip3 install dlib

#Install Flask
RUN pip3 install flask
#Install pymongo
RUN python3 -m pip install pymongo

#Install jsonpickle
RUN apt-get install python3-jsonpickle -y
#Install face_recognition
RUN pip3 install face_recognition
