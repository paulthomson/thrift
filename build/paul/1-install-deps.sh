#!/bin/bash
set -x
set -e
set -u

sudo mkdir -p /data/bin
sudo chmod uga+rwx /data/bin

if [ "$(uname)" == "Darwin" ];
then
  brew install bison
  pushd /data/bin
  wget https://github.com/c4milo/github-release/releases/download/v1.0.9/github-release_v1.0.9_darwin_amd64.tar.gz
  tar xf github-release_v1.0.9_darwin_amd64.tar.gz
  popd
fi

if [ "$(uname)" == "Linux" ];
then
  sudo apt-get update
  sudo apt-get -y install automake bison cmake flex g++ git libevent-dev libssl-dev libtool make pkg-config wget zip tar
  pushd /data/bin
  wget https://github.com/c4milo/github-release/releases/download/v1.0.9/github-release_v1.0.9_linux_amd64.tar.gz
  tar xf github-release_v1.0.9_linux_amd64.tar.gz
  popd
fi

