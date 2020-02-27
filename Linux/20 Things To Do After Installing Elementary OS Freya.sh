# 20 Things To Do After Installing Elementary OS Freya.
# =====================================================

# 01 - Update your system
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# 02 - Install additional drivers
# Software & Updates - Additional Drivers

# 03 - Install Multimedia Codecs and Enable DVD Playback
sudo apt-add-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav

Enable DVD Playback
sudo /usr/share/doc/libdvdread4/install-css.s­h

# 04 - Install VLC Media Player
sudo apt-get install vlc

# 05 - Install Plugin Flash Player and Pepper Flash
sudo apt-get install flashplugin-installer pepperflashplugin-nonfree

# 06 - Install JAVA
# Download the latest JAVA 8 SE development kit from here: https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
sudo mkdir /opt/java
sudo tar -zxf ~/Downloads/jdk-8u5-linux-x64.tar.gz -C /opt/java
update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_<YourVersion>/bin/java 100
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_<YourVersion>/bin/javac 100

# 07 - Install Support for Archive Formats and Restricted Extras
sudo apt-get install -y unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip

# 08 - Install LibreOffice Suites
sudo apt-get install libreoffice libreoffice-gtk libreoffice-style-sifr

# 09 - Install Additional Web Browser
sudo apt-get install chromium-browser firefox

# 10 - Install Torrent Client
sudo apt-get install transmission

# 11 - Install Download Manager
wget http://xdman.sourceforge.net/xdman_mi...
sudo dpkg -i xdman_mint_ubuntu.deb

# 12 - Install Graphic Editor
sudo apt-get install gimp inkscape

# 13 - Install Indicator Synapse
sudo apt-get install indicator-synapse

# 14 - Install Elementary Tweak
sudo apt-add-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-get install elementary-tweak

# 15 - Insall Birdie Twitter Client
sudo add-apt-repository ppa:birdie-team/stable
sudo apt-get update
sudo apt-get install birdie

# 16 - Install Pidgin and Skype
sudo apt-get install skype pidgin

# 17 - Install Steam Gaming Client
sudo apt-get install steam

# 18 - Install Bleachbit System Cleaner
sudo apt-get install bleachbit

# 19 - Install Cloud Storage

Download DropBox : https://www.dropbox.com/install?os=lnx

Install Google Drive :
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse

# 20 - For Laptop : Install TLP for Improve Battery Life and Reduce Overheating
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo tlp start
