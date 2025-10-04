#!/bin/bash

source ./common_deps.sh

if [ -z $DEPENDENCIES ]; then
    echo "Dependencies not specified! Quitting..."
    exit 1
fi

echo "Installing dependencies..."

sudo apt update -y && \
    sudo apt upgrade -y && \
    sudo apt install -y ${DEPENDENCIES[@]}
