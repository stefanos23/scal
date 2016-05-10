#!/bin/bash

if [[ $(uname -s) = "Darwin" ]]; then
  echo "Darwin before install start"
  brew update
  brew outdated google-perftools || brew upgrade google-perftools
  echo "Darwin before install end"
fi

if [[ $(uname -s) = "Linux" ]]; then
  echo "Linux before install start"
  # We need this to have g++4.8 available in apt
  sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
  sudo apt-get update -qq
  echo "Linux before install end"
fi
