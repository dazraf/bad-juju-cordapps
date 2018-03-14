# Base image from (http://phusion.github.io/baseimage-docker)
FROM phusion/baseimage:0.9.22

# Working directory for Corda
WORKDIR /opt/corda

# Install OpenJDK from zulu.org and update system
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 \
 && (echo "deb http://repos.azulsystems.com/ubuntu stable main" >> /etc/apt/sources.list.d/zulu.list) \
 && apt-get -qq update \
 && apt-get -y upgrade -y -o Dpkg::Options::="--force-confold" \
 && apt-get -qqy install zulu-8 ntp \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download latest corda jar
ADD https://dl.bintray.com/r3/corda/net/corda/corda/2.0.0/corda-2.0.0.jar /opt/corda/corda.jar

USER root

ENTRYPOINT ["/bin/bash"]