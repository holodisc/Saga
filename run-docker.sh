#!/bin/bash

set -eu

docker build --tag saga .

docker run -h 'saga-test' -it saga /saga/Docker/setup.sh
