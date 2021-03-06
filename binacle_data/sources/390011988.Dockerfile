FROM fedora:26
MAINTAINER Michael James <mjames@ucar.edu>

USER root
RUN useradd gempak
#RUN yum update yum -y
RUN yum groupinstall "Development tools" -y
RUN yum install -y \
  libxslt \
  git \
  rpm-build \
  openmotif-devel \
  gcc \
  gcc-c++ \
  gcc-gfortran \
  libX11-devel \
  libXt-devel \
  libXext-devel \
  libXp-devel \
  libXft-devel \
  libXtst-devel \
  xorg-x11-xbitmaps \
  flex \
  byacc \
  *fonts-ISO8859-* \
  python-devel

# Bootstrap install extlibs...
RUN rpm -ivh https://www.unidata.ucar.edu/downloads/gempak/latest/gempak-extlibs-7.5.1-1.fc26.x86_64.rpm
