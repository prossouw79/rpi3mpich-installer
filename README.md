# rpi3mpich-installer
This repository currently holds two scripts:
	install_stretch.sh - installs MPICH 3.2 on Raspbian Stretch.
	install_osu_bench.sh - installs the OSU microbenchmark suite on Raspbian Stretch.

Usage:
sudo sh install_stretch.sh
sudo reboot
sudo sh install_osu_bench.sh
sudo reboot

It has only been tested on the Raspberry Pi 3 Model B running Raspbian Stretch, but should work fine for Jessie and possibly others.
