FROM cdrx/fpm-ubuntu:16.04

RUN apt-get -y update && apt-get -y install python-setuptools python-dev libssh2-1-dev python-pip git
RUN pip install -U setuptools
RUN pip install -U pip wheel
RUN pip install cython

ENV EMBEDDED_LIB 0
ENV HAVE_AGENT_FWD 0
ENV SYSTEM_LIBSSH2 1
