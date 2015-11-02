#!/bin/bash

set -eu

docker build --tag saga .

docker run -p 80:80 -h 'saga-test' -it saga /saga/Docker/setup.sh
