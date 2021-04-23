cd ~
echo "Changing directory: $(pwd)"

timedatectl set-local-rtc 1 --adjust-system-clock

sudo os-prober
sudo update-grub2

sudo apt update
sudo apt upgrade

sudo apt-get update
sudo apt-get upgrade

sudo apt autoremove
sudo apt install g++ make git libssl-dev -y

gcc -v
g++ -v
make -v
git --version
openssl version

git config --global user.name "<username>"
git config --global user.email "<github_email>"

mkdir Workspace Software
mkdir Software/Download Software/Install

cd Software/Download
echo "Changing directory: $(pwd)"
git clone https://github.com/c-soni/BashPrompt.git BashPrompt
cd BashPrompt
echo "Changing directory: $(pwd)"
cat BashPrompt.sh >> ~/.bashrc

cd ~/Software/Download
echo "Changing directory: $(pwd)"
git clone https://github.com/c-soni/monego.git Monego
cd Monego
echo "Changing directory: $(pwd)"
sudo cp Monego/* /usr/local/share/fonts
sudo fc-cache -f
fc-list | grep "Monego"

cd ~/Software/Download
echo "Changing directory: $(pwd)"
git clone https://gitlab.kitware.com/cmake/cmake.git CMake
cd CMake
echo "Changing directory: $(pwd)"
git checkout v3.19.5
./bootstrap --parallel=6
make -j6
sudo make install

cd ~/Software/Download
echo "Changing directory: $(pwd)"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b -p ~/Software/Install/Miniconda
source ~/Software/Install/Miniconda/bin/activate
conda init

cd ~/Software/Download
echo "Changing directory: $(pwd)"
sudo apt-get install linux-headers-$(uname -r) -y
wget https://developer.download.nvidia.com/compute/cuda/11.2.1/local_installers/cuda_11.2.1_460.32.03_linux.run
sudo sh cuda_11.2.1_460.32.03_linux.run --silent --driver --toolkit --samples --samplespath=~/Workspace/Samples --run-nvidia-xconfig
sudo nvidia-persistenced --verbose
echo "
# Cuda Toolkit paths
export PATH=/usr/local/cuda/bin\${PATH:+:\${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}" >> ~/.bashrc

echo "Done"
