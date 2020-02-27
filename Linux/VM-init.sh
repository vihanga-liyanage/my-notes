# Quick script to install basic software in a VM.

# Install Java8
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# Install Maven
sudo apt-get install -y maven

# Install git
sudo apt-get install -y git

# Install unzip
sudo apt install -y unzip
