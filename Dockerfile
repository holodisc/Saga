FROM armbuild/debian

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'mysql-server mysql-server/root_password password mysql' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password mysql' | debconf-set-selections

RUN apt-get update
RUN apt-get install -y mysql-server

ADD . /tmp/saga
