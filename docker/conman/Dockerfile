FROM geodynamics/conman-buildenv-bionic:latest

RUN useradd \
  --create-home \
  conman_user

USER conman_user

WORKDIR /home/conman_user

RUN git clone 'https://github.com/geodynamics/conman.git'

WORKDIR /home/conman_user/conman/src

RUN make

WORKDIR /home/conman_user