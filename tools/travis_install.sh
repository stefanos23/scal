#!/bin/bash

if [[ $(uname -s) = "Darwin" ]]; then
  echo "Darwin install start"
  echo " -> export gcc 4.8"
  export CXX=g++-4.8
  export CC=gcc-4.8
  gcc --version
  
  echo " -> install gflags"
  wget https://gflags.googlecode.com/files/libgflags0_2.0-1_amd64.deb
  wget https://gflags.googlecode.com/files/libgflags-dev_2.0-1_amd64.deb
  sudo dpkg -i libgflags0_2.0-1_amd64.deb
  sudo dpkg -i libgflags-dev_2.0-1_amd64.deb

  #curl -o gflags-2.0-no-svn-files.tar.gz https://gflags.googlecode.com/files/gflags-2.0-no-svn-files.tar.gz
  #tar -xzvf gflags-2.0-no-svn-files.tar.gz
  #cd gflags-2.0
  #./configure && make && sudo make install
  #cd ..
  
  tools/make_deps.sh
  echo "Darwin install end"
fi

if [[ $(uname -s) = "Linux" ]]; then
  echo "Linux install start"
  echo " -> install gcc-4.8"
  sudo apt-get install -qq gcc-4.8 g++-4.8 
  # We want to compile with g++ 4.8 when rather than the default g++
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 90
  gcc --version
  
  echo " -> install gflags"
  sudo apt-get install --fix-missing google-perftools libgoogle-perftools-dev cmake libgtest-dev
  wget https://gflags.googlecode.com/files/libgflags0_2.0-1_amd64.deb
  wget https://gflags.googlecode.com/files/libgflags-dev_2.0-1_amd64.deb
  sudo dpkg -i libgflags0_2.0-1_amd64.deb
  sudo dpkg -i libgflags-dev_2.0-1_amd64.deb

  tools/make_deps.sh
  echo "Linux install end"
fi