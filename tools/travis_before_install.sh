#!/bin/bash

if [[ $(uname -s) = "Darwin" ]]; then
  echo "Darwin before install start"
  export CC=/usr/local/bin/gcc-4.8
  export CXX=/usr/local/bin/gcc-4.8
  export GYP_DEFINES="gcc-4.8"
  echo "Darwin before install end"
fi

if [[ $(uname -s) = "Linux" ]]; then
  echo "Linux before install start"
  # We need this to have g++4.8 available in apt
  sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
  sudo apt-get update -qq
  echo "Linux before install end"
fi
