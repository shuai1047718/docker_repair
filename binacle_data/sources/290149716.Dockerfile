FROM epitechcontent/epitest-docker:latest AS epitech-docker

MAINTAINER Lucas LE RAY

WORKDIR /workspace

COPY ./build_sources/bin/* /usr/bin/

COPY ./build_sources/id_rsa.pub /root/.ssh/id_rsa.pub
COPY ./build_sources/id_rsa /root/.ssh/id_rsa

RUN yum update -y
RUN yum install -y bzip2 SFML emacs
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | sh

ENV LOGIN lucas.le-ray@epitech.eu

RUN git config --global user.email $LOGIN
RUN git config --global user.name $LOGIN