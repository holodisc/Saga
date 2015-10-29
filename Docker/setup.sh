#!/bin/bash

service mysql start

echo 'CREATE DATABASE `sa-ga.city`;' | mysql --user=root --password=mysql

# Drop to a new shell
/bin/bash
