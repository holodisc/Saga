#!/bin/bash

set -eu

docker build --tag saga .

docker run -it saga /tmp/saga/Docker/setup.sh
