#!/bin/bash

if [[ $(uname -s) = "Darwin" ]]; then
  echo "Darwin install start"
  
  # echo " -> install gflags"
  # git clone https://github.com/gflags/gflags.git
  # cd gflags
  # ccmake
  # make
  # make test
  # make install
  # cd ..
  # install gflags done.
  
  tools/make_deps.sh
  echo "Darwin install end"
fi

if [[ $(uname -s) = "Linux" ]]; then
  echo "Linux install start"
  # We want to compile with g++ 4.8 when rather than the default g++
  # sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 90
  
  echo " -> install gflags"
  sudo apt-get install --fix-missing google-perftools libgoogle-perftools-dev cmake libgtest-dev
  # sudo apt-get install gflags

  wget https://gflags.googlecode.com/files/libgflags0_2.0-1_amd64.deb
  wget https://gflags.googlecode.com/files/libgflags-dev_2.0-1_amd64.deb
  sudo dpkg -i libgflags0_2.0-1_amd64.deb
  sudo dpkg -i libgflags-dev_2.0-1_amd64.deb

  tools/make_deps.sh
  echo "Linux install end"
fi