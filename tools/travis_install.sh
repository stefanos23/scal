#!/bin/bash

if [[ $(uname -s) = "Darwin" ]]; then
  echo "Darwin install start"
  echo ${CXX}
  echo ${CC}
  
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
    
  echo " -> install gflags"
  sudo apt-get install --fix-missing google-perftools libgoogle-perftools-dev cmake libgtest-dev

  wget https://gflags.googlecode.com/files/libgflags0_2.0-1_amd64.deb
  wget https://gflags.googlecode.com/files/libgflags-dev_2.0-1_amd64.deb
  sudo dpkg -i libgflags0_2.0-1_amd64.deb
  sudo dpkg -i libgflags-dev_2.0-1_amd64.deb

  tools/make_deps.sh
  echo "Linux install end"
fi