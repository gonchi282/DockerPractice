FROM jenkins/jenkins:2.491-jdk21

USER root

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y vim

RUN gpasswd -a jenkins sudo

RUN echo jenkins:jenkins | chpasswd

USER jenkins
