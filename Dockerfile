FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'mysql-server mysql-server/root_password password mysql' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password mysql' | debconf-set-selections

RUN apt-get update

# Requires packages
RUN apt-get install -y mysql-server
RUN apt-get install -y libapache2-mod-php5

# Useful stuff
RUN apt-get install -y curl vim

ADD . /saga
