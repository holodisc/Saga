#!/bin/bash

set -eu

cp /saga/Site/application/config/database.php /saga/Site/application/config/development/
cp /saga/Docker/saga.conf /etc/apache2/sites-available

chown -R www-data /saga

a2dissite 000-default
a2ensite saga
a2enmod rewrite

service mysql start
service apache2 start

echo 'CREATE DATABASE `sa-ga.city`;' | mysql --user=root --password=mysql

mysql --user=root --password=mysql 'sa-ga.city' < /saga/Database/sa-ga_city.sql

# Drop to a new shell
/bin/bash
