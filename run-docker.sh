#!/bin/bash

set -eu

FORWARD_PORT=80


function print_help {
    echo "Usage: $0 [-h] [-p port]"
    printf "  -h\t%s\n" "this help"
    printf "  -p\t%s\n" "host OS port to forward the container's port 80 to (default: 80)"
}

while getopts ":hp:" opt; do
    case $opt in
        p)
            FORWARD_PORT=$OPTARG
            echo "Forwarding container port 80 to port $FORWARD_PORT"
            ;;
        h)
            print_help
            exit 1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

docker build --tag saga .

docker run -p $FORWARD_PORT:80 -h 'saga-test' -it saga /saga/Docker/setup.sh
