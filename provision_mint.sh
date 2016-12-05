# In firefox:
# - add Google search
# - add tab plugin (Tab Wheel Scroll)

sudo apt-get update

#----------------
# MUSIC PLAYER
#----------------
sudo apt install clementine

#----------------
# PRINTER
#----------------
mkdir hlip_download
cd hlip_download
wget https://sourceforge.net/projects/hplip/files/hplip/3.16.10/hplip-3.16.10.run/download
mv download hplip-3.16.10.run
chmod +x hplip-3.16.10.run
./hplip-3.16.10.run # INTERACTIVE, better manual installation
cd ..
rm -rf hlip_download
sudo apt-get install hplip-gui

#----------------
# VIM
#----------------
sudo apt-get install vim

#----------------
# DEVELOPMENT
#----------------
sudo apt install build-essential
sudo apt-get install libboost-all-dev
# GNU Multiprecission library (GMP) https://gmplib.org
sudo apt-get install lzip
wget https://gmplib.org/download/gmp/gmp-6.1.1.tar.lz
tar -xvf gmp-6.1.1.tar.lz
cd gmp-6.1.1
./configure --enable-cxx
make
sudo make install
cd ..
rm -rf gmp-6.1.1

#----------------
# PYTHON
#----------------
sudo apt install ipython

#----------------
# GIT
#----------------
sudo apt install git
git config --global credential.helper "cache --timeout=3600"

#----------------
# CLANG
#----------------
# CLANG (http://apt.llvm.org/)
# Add to repositories:
#	deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main
#	deb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main
# and then get the key:
wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
# to finally install the packages:
sudo apt-get install llvm clang-3.8 clang++-3.8 clang lldb-3.8

#----------------
# GNU COMPILERS
#----------------
# Regular compilers and cmake
sudo apt install cmake g++ gfortran

#----------------
# CUDA
#----------------
sudo apt-get install linux-headers-$(uname -r)

wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
mv cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
echo 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}' >> ~/.bashrc

