FROM ubuntu:20.04

LABEL org.opencontainers.image.authors='Artem Motozov <motozov.a.v@gmail.com>'

ARG TAG=v1.13.3

RUN apt-get update && \
    apt-get install -y git curl wget

WORKDIR /sitl

RUN git clone https://github.com/PX4/PX4-Autopilot.git --branch=${TAG} --recursive && \
    touch /.dockerenv && \
    bash ./PX4-Autopilot/Tools/setup/ubuntu.sh

WORKDIR /sitl/PX4-Autopilot

RUN DONT_RUN=1 make px4_sitl gazebo

ENV PX4_HOME_LAT 56.8625617
ENV PX4_HOME_LON 24.1131178
ENV PX4_HOME_ALT 11.86

ENTRYPOINT HEADLESS=1 make px4_sitl gazebo
