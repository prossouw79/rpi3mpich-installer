# ******************************
# Based on: https://gist.githubusercontent.com/JordiCorbilla/2b3dde3a497278ee2e5aafb05471d2e5/raw/3788c235e0e5e36569517b2edcec4bd15f2f762e/mpich3install.sh
# These steps will allow you to install MPICH3 to your Raspbian Stretch distro
# ******************************

sudo apt-get update

sudo apt dist-upgrade -y
sudo apt install build-essential gfortran -y

sudo mkdir ~/mpich3
cd ~/mpich3

sudo wget -nc http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz

sudo tar xfz mpich-3.2.tar.gz

sudo mkdir /home/rpimpi/
sudo mkdir /home/rpimpi/mpi-install
mkdir /home/pi/mpi-build

cd /home/pi/mpich3/mpich-3.2/
sudo ./configure -prefix=/home/rpimpi/mpi-install
sudo make -j4
sudo make install

cd ..
echo "PATH=$PATH:/home/rpimpi/mpi-install/bin" >> .bashrc

sudo reboot

# Test that MPI works
#mpiexec -n 1 hostname
