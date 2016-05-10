#!/bin/bash

if [[ $(uname -s) = "Darwin" ]]; then
  echo "Darwin install start"
  curl -o gflags-2.0-no-svn-files.tar.gz https://gflags.googlecode.com/files/gflags-2.0-no-svn-files.tar.gz
  tar -xzvf gflags-2.0-no-svn-files.tar.gz
  cd gflags-2.0
  ./configure && make && sudo make install
  cd ..
  tools/make_deps.sh
  echo "Darwin install end"
fi

if [[ $(uname -s) = "Linux" ]]; then
  echo "Linux install start"
  sudo apt-get install -qq gcc-4.8 g++-4.8 
  # We want to compile with g++ 4.8 when rather than the default g++
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 90
  
  sudo apt-get --fix-missing install google-perftools libgoogle-perftools-dev cmake libgtest-dev
  wget https://gflags.googlecode.com/files/libgflags0_2.0-1_amd64.deb
  sudo dpkg -i libgflags0_2.0-1_amd64.deb
  wget https://gflags.googlecode.com/files/libgflags-dev_2.0-1_amd64.deb
  sudo dpkg -i libgflags-dev_2.0-1_amd64.deb

  tools/make_deps.sh
  echo "Linux install end"
fi