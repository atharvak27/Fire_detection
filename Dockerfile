# System
FROM ubuntu:18.04  
WORKDIR /home

# Installing Dependancies
RUN apt update
RUN apt-get clean 

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y git wget python3-dev python3-pip unzip

RUN python3 -m pip install pip --upgrade
RUN pip3 install scikit-build
RUN apt-get update
RUN apt install -y cmake curl

# Install dependancies of your application here
# RUN pip3 install <dependancy1>
# RUN apt install <dependancy2>



RUN pip install tensorflow

RUN git clone https://github.com/tensorflow/models.git

RUN apt-get install -y protobuf-compiler python-lxml python-pil
RUN pip install --upgrade pip
RUN pip install Cython pandas tf-slim lvis headless
WORKDIR /home/models/research/
RUN protoc object_detection/protos/*.proto --python_out=.




# Copy neccessary file like inference program etc to docker image

WORKDIR /home/models/research
COPY model .

