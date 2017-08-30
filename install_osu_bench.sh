#!/bin/bash

# ******************************
# These steps will allow you to install the osu-micro-benchmarks suite on Raspbian Stretch distro
# ******************************

sudo apt-get update

sudo apt dist-upgrade -y
sudo apt install build-essential gfortran -y

sudo mkdir /home/pi/osu
sudo wget -O /home/pi/osu/osu-micro-benchmarks.tar.gz  http://mvapich.cse.ohio-state.edu/download/mvapich/osu-micro-benchmarks-5.3.2.tar.gz
cd /home/pi/osu

FILE="osu-micro-benchmarks.tar.gz"
if [ -f $FILE ]; then
    echo "$FILE exists. Continuing..."

    sudo tar xfz osu-micro-benchmarks.tar.gz

    cd /home/pi/osu/osu-micro-benchmarks-5.3.2
    sudo ./configure CC=/home/rpimpi/mpi-install/bin/mpicc CXX=/home/rpimpi/mpi-install/bin/mpicxx
    make -j4
    make install

    cd /home/pi

    echo "PATH=$PATH:/home/pi/osu/osu-micro-benchmarks-5.3.2/mpi/collective:/home/pi/osu/osu-micro-benchmarks-5.3.2/mpi/one-sided:/home/pi/osu/osu-micro-benchmarks-5.3.2/mpi/pt2pt:/home/pi/osu/osu-micro-benchmarks-5.3.2/mpi/startup" >> .bashrc

    cat .bashrc
    #sudo reboot
else
   echo "$FILE not downloaded. Installation aborted."
fi
