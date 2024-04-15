FROM geodynamics/conman-buildenv-bionic:latest

RUN useradd \
  --create-home \
  conman_user

USER conman_user

WORKDIR /home/conman_user

RUN git clone 'https://github.com/geodynamics/conman.git'

ENV PATH="/home/conman_user/conman:${PATH}"

RUN cd conman/src; make
