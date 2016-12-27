#pycharm

# In firefox:
# - add Google search
# - add tab plugin (Tab Wheel Scroll)

sudo apt-get update

#----------------
# SOFTWARE
#----------------
sudo apt install clementine
sudo apt install inkscape

#----------------
# tkdiff
#----------------
sudo apt install tkcvs

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
sudo apt install python-pip
sudo pip install --upgrade pip
sudo pip install setuptools

# For the blog manage script
sudo pip install python-vagrant
git clone https://github.com/willyg302/clip.py.git
cd clip.py/
sudo python setup.py install
cd ..
sudo rm -rf clip.py
sudo pip install ghp-import

# seaborn, matplotlib, pandas and numpy
sudo pip install seaborn
sudo apt-get install python-tk

#----------------
# Youtube downloads
#----------------
sudo pip install --upgrade youtube-dl
sudo apt install ffmpeg lame
mkdir ~/bin
cat > ~/bin/youtube2mp3 << 'EOF'
#!/bin/bash 
# A very simple Bash script to download a YouTube video 
# and extract the music file from it. 
address=$1 
regex='v=(.*)' 
if [[ $address =~ $regex ]]; then 
video_id=${BASH_REMATCH[1]}
video_id=$(echo $video_id | cut -d'&' -f1) 
video_title="$(youtube-dl --get-title $address)" 
youtube-dl $address 
ext="flv" 
ffmpeg -i $video_id.$ext "$video_title".wav 
lame "$video_title".wav "$video_title".mp3 
rm $video_id.$ext "$video_title".wav 
else 
echo "Sorry but the system encountered a problem." 
fi

EOF

chmod +x ~/bin/youtube2mp3

#----------------
# R
#----------------
sudo apt install r-base-core libjpeg62 r-cran-rcurl

wget https://download1.rstudio.org/rstudio-1.0.44-amd64.deb
sudo dpkg -i rstudio-1.0.44-amd64.deb
rm rstudio-1.0.44-amd64.deb

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

#----------------
# VAGRANT
#----------------
wget https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0_x86_64.deb
sudo dpkg -i vagrant_1.9.0_x86_64.deb
rm vagrant_1.9.0_x86_64.deb
#plugin
vagrant plugin install vagrant-triggers

#----------------
# VIRTUALBOX
#----------------
# Alternative: adding ppa (https://www.virtualbox.org/wiki/Linux_Downloads) 
wget http://download.virtualbox.org/virtualbox/5.1.10/virtualbox-5.1_5.1.10-112026~Ubuntu~xenial_amd64.deb
sudo dpkg -i virtualbox-5.1_5.1.10-112026~Ubuntu~xenial_amd64.deb
rm virtualbox-5.1_5.1.10-112026~Ubuntu~xenial_amd64.deb
sudo apt-get install dkms

