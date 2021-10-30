FROM jenkins/jenkins:lts-jdk11

USER root
WORKDIR /root

RUN apt-get -y update

RUN echo "instalar software necesario"
RUN apt-get install -y npm net-tools wget
