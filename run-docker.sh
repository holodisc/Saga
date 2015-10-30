#!/bin/bash

set -eu

docker build --tag saga .

docker run -it saga /saga/Docker/setup.sh
