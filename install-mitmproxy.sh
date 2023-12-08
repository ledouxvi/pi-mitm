#!/bin/bash

# Set -e so that if any command fails the script will exit immediately.
set -e

# Install requirements
sudo apt update
#sudo apt-get -y install \
#  libffi-dev \
#  libbz2-dev \
#  liblzma-dev \
#  libsqlite3-dev \
#  libncurses5-dev \
#  libgdbm-dev \
#  zlib1g-dev \
#  libreadline-dev \
#  libssl-dev \
#  tk-dev \
#  build-essential \
#  libncursesw5-dev \
#  libc6-dev \
#  openssl \
#  git

# Install mitmproxy
apt install mitmproxy

