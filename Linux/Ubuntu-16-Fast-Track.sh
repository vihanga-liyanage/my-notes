echo "=========================================================="
echo "Adding all ppa's..."
echo "=========================================================="
sudo apt-add-repository -y ppa:mc3man/trusty-media
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:ravefinity-project/ppa
sudo add-apt-repository -y ppa:indicator-multiload/stable-daily

echo "=========================================================="
echo "Updating system..."
echo "=========================================================="
sudo apt-get update

echo "=========================================================="
echo "Upgrading system..."
echo "=========================================================="
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

echo "=========================================================="
echo "Installing Multimedia Codecs and Enable DVD Playback..."
echo "=========================================================="
sudo apt-get install -y ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav

echo "=========================================================="
echo "Installing VLC Media Player..."
echo "=========================================================="
sudo apt-get install -y vlc

echo "=========================================================="
echo "Installing Plugin Flash Player and Pepper Flash..."
echo "=========================================================="
sudo apt-get install -y flashplugin-installer pepperflashplugin-nonfree

echo "=========================================================="
echo "Installing JAVA..."
echo "=========================================================="
# 06 - Install JAVA
# Download the latest JAVA 8 SE development kit from here: https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
sudo mkdir /opt/java
sudo tar -zxf ~/Downloads/jdk-8u5-linux-x64.tar.gz -C /opt/java
update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_<YourVersion>/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_<YourVersion>/bin/javac 100

echo "=========================================================="
echo "Installing Support for Archive Formats and Restricted Extras..."
echo "=========================================================="
sudo apt-get install -y unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip

echo "=========================================================="
echo "Installing Additional Web Browser..."
echo "=========================================================="
sudo apt-get install -y chromium-browser

echo "=========================================================="
echo "Installing Graphic Editor..."
echo "=========================================================="
sudo apt-get install -y gimp inkscape

echo "=========================================================="
echo "Installing Indicator Synapse..."
echo "=========================================================="
sudo apt-get install -y indicator-synapse

echo "=========================================================="
echo "Installing TLP for Improve Battery Life and Reduce Overheating..."
echo "=========================================================="
sudo apt-get install -y tlp tlp-rdw
sudo tlp start

echo "=========================================================="
echo "Installing unity tweak tool..."
echo "=========================================================="
sudo apt-get install -y unity-tweak-tool

echo "=========================================================="
echo "Installing sublime text..."
echo "=========================================================="
sudo apt-get install -y sublime-text-installer 

echo "=========================================================="
echo "Installing numix icon pack and gnome icon pack..."   
echo "=========================================================="
sudo apt-get install -y numix-icon-theme numix-icon-theme-circle
sudo apt-get install gnome-icon-theme gnome-icon-theme-full gnome-icon-theme-extras

echo "=========================================================="
echo "Installing flat colors..."
echo "=========================================================="
sudo apt-get install -y ambiance-flat-colors
sudo apt-get install -y radiance-flat-colors

echo "=========================================================="
echo "Installing Apache server..."
echo "=========================================================="
sudo apt-get install -y apache2
sudo ufw allow in "Apache Full"

echo "=========================================================="
echo "Installing ack-grep text finder tool..."
echo "=========================================================="
sudo apt install -y ack-grep

echo "=========================================================="
echo "Installing system monitor indicator..."
echo "=========================================================="
sudo apt-get install -y indicator-multiload
indicator-multiload

echo "=========================================================="
echo "Installing git..."
echo "=========================================================="
sudo apt-get install -y git

echo "=========================================================="
echo "Installing vim..."
echo "=========================================================="
sudo apt-get install -y vim

echo "=========================================================="
echo "Installing apache ant..."
echo "=========================================================="
sudo apt-get install ant

echo "=========================================================="
echo "Installing apache maven..."
echo "=========================================================="
sudo apt-get install maven

echo "=========================================================="
echo "Installing Mac like gestures..."
echo "=========================================================="
sudo gpasswd -a $USER input
sudo apt-get install ruby
sudo apt-get install libinput-tools
sudo apt-get install xdotool
sudo gem install fusuma
mkdir -p ~/.config/fusuma
subl ~/.config/fusuma/config.yml
	# Add below config and save.
		# swipe:
		#   3: 
		#     left: 
		#       command: 'xdotool key alt+Shift+Tab'
		#     right: 
		#       command: 'xdotool key alt+Tab'
		#     up: 
		#       command: 'xdotool key super+w'

		# threshold:
		#   swipe: 0.4
		#   pinch: 0.4

		# interval:
		#   swipe: 0.8
		#   pinch: 0.1
sudo fusuma
# Add to startup apps for day to day use.
