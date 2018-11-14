#Download base image ubuntu 16.04
#FROM ubuntu:16.04

#Download base image bmabir17/opencv-nodejs:v1
FROM bmabir17/opencv-nodejs:v1


LABEL maintainer "bmabir17@gmail.com"
ENV OPENCV_VERSION 3.4.2

#update ubuntu Software repository
RUN apt-get update
RUN apt-get install -y build-essential

#Install nano
RUN apt-get install nano

#Dlib Installation
RUN apt-get install -y libopenblas-dev liblapack-dev
RUN apt-get install -y libx11-dev libgtk-3-dev
RUN pip3 install dlib

#Install Flask
RUN pip3 install flask
#Install pymongo
RUN python3 -m pip install pymongo

#Install jsonpickle
RUN apt-get install -y python3-jsonpickle
#Install face_recognition
RUN pip3 install face_recognition
#Install requests
RUN pip3 install requests
#Install scipy
RUN pip3 install scipy
#Install flask_cors
RUN pip3 install -U flask-cors
#Install sklearn
RUN pip3 install -U scikit-learn
#Install jsonrpcserver
RUN pip3 install jsonrpcserver
#Install jsonrpcclient
RUN pip3 install "jsonrpcclient[requests]"
#Install flask-socketio
RUN pip3 install flask-socketio
#Install httpserver
RUN pip3 install httpserver
#Install lsof
RUN apt-get install -y lsof
ADD repo_setup.sh /home
