# Execute .sh files in elementary os
# =============================================================================================================
    sudo sh <filename>.sh
# Elementary doesn't allow file permission modifications in ntfs drives. 
# Those files comes with default rw only hense cannot execute.
# You can copy them to system drive and then change the permission if you wish

# Uninstall any software installed from apt-get
# =============================================================================================================
    sudo apt-get autoremove <app name>

# Elementary Login screen restore
# =============================================================================================================
    sudo nano /etc/lightdm/lightdm.conf
    # Copy paste below text
        [SeatDefaults]
        greeter-session=pantheon-greeter
        greeter-show-remote-login=false
        allow-guest=false
    # Save and Restart

# To change date format to "Wednesday, 09 June 2016, 11:23"
# =============================================================================================================
    gsettings set com.canonical.indicator.datetime time-format "custom"
    gsettings set com.canonical.indicator.datetime custom-time-format "%A, %d %B %Y, %I:%M"

# Changing terminal prompt
# =============================================================================================================
    # custom prompt
        BLACK="\[$(tput setaf 0)\]"
        YELLOW="\[$(tput setaf 1)\]"
        VIOLET_1="\[$(tput setaf 2)\]"
        WHITE="\[$(tput setaf 3)\]"
        VIOLET_2="\[$(tput setaf 4)\]"
        GREEN="\[$(tput setaf 9)\]"
        RESET="\[$(tput sgr0)\]"
    # Example
        export PS1="${YELLOW}\u@\h${RESET}>"

# Completly remove java - all versions
# =============================================================================================================
    #1. Remove all the Java related packages (Sun, Oracle, OpenJDK, IcedTea plugins, GIJ):
        
        dpkg-query -W -f='${binary:Package}\n' | grep -E -e '^(ia32-)?(sun|oracle)-java' -e '^openjdk-' -e '^icedtea' -e '^(default|gcj)-j(re|dk)' -e '^gcj-(.*)-j(re|dk)' -e '^java-common' | xargs sudo apt-get -y remove   
        sudo apt-get -y autoremove

    #2. Purge config files:

        dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge

    #3. Remove Java config and cache directory:

        sudo bash -c 'ls -d /home/*/.java' | xargs sudo rm -rf

    #4. Remove manually installed JVMs:

        sudo rm -rf /usr/lib/jvm/*

    #5. Remove Java entries, if there is still any, from the alternatives:

        for g in ControlPanel java java_vm javaws jcontrol jexec keytool mozilla-javaplugin.so orbd pack200 policytool rmid rmiregistry servertool tnameserv unpack200 appletviewer apt extcheck HtmlConverter idlj jar jarsigner javac javadoc javah javap jconsole jdb jhat jinfo jmap jps jrunscript jsadebugd jstack jstat jstatd native2ascii rmic schemagen serialver wsgen wsimport xjc xulrunner-1.9-javaplugin.so;
        sudo update-alternatives --remove-all $g; done

    #6. Search for possible remaining Java directories:

        sudo updatedb
        sudo locate -b '\pack200'

# Setup JAVA_HOME
# =============================================================================================================
    sudo vim /etc/environment
    # Add 
        JAVA_HOME="/usr/lib/jvm/java-7-oracle" 
    # to the end and save.
    source /etc/environment 

# To switch between java 7 and 8
# =============================================================================================================
    sudo update-java-alternatives --set java-<number>-oracle 

# Add_intellij_launcher
# =============================================================================================================
	# Create file:
	sudo subl /usr/share/applications/intellij.desktop

	# Add the following
    	[Desktop Entry]
    	Version=13.0
    	Type=Application
    	Terminal=false
    	Icon[en_US]=/home/rob/.intellij-13/bin/idea.png
    	Name[en_US]=IntelliJ
    	Exec=/home/rob/.intellij-13/bin/idea.sh
    	Name=IntelliJ
    	Icon=/home/rob/.intellij-13/bin/idea.png

	# Mod permissions
	sudo chmod 644 /usr/share/applications/intellij.desktop
	sudo chown root:root /usr/share/applications/intellij.desktop

# Remove broken launcher icons
# =============================================================================================================
	# to view 
	for i in {/usr,~/.local}/share/applications/*.desktop; do which $(grep -Poh '(?<=Exec=).*?( |$)' $i) > /dev/null || echo $i; done
	# to remove
	sudo rm $(for i in {/usr,~/.local}/share/applications/*.desktop; do which $(grep -Poh '(?<=Exec=).*?( |$)' $i) > /dev/null || echo $i; done)

# Command to remove all deleted files from svn repo
# =============================================================================================================
    svn rm $( svn status | sed -e '/^!/!d' -e 's/^!//' )

# Install a .deb package
# =============================================================================================================
	sudo dpkg -i DEB_PACKAGE

# Remove package using dpkg
# =============================================================================================================
	sudo dpkg -r PACKAGE_NAME

# Get diff patch
# =============================================================================================================
	diff -uw <file 1> <file 2>

# Rename all files by replacing regex -> replace 'wso2am_' with 'wso2am-2.0.0_'
# =============================================================================================================
	for file in *; do mv "$file" `echo $file |sed -e 's/wso2am_/wso2am-2.0.0_/g'`;  done

# Find text in a path
# =============================================================================================================
	ack-grep wso2am

# View tomcat log
# =============================================================================================================
	tail -f /var/log/tomcat8/catalina.out

# Ubuntu 12.04 get terminal colors
# =============================================================================================================
	Open ~/.bashrc in text editor and uncomment line:
	#force_color_prompt=yes
	save then execute source ~/.bashrc

# apt-get stuck at 0 [Connecting to us.archive.ubuntu.com]
# =============================================================================================================
	sudo subl /etc/gai.conf
	#change line ~54 to uncomment the following:
	   precedence ::ffff:0:0/96  100
	# make sure to change the exact line. There are similar once that ends in 10 instead of 100.
	# Problem: ISPs are starting to setup an internal IPv6 network in preparation for eventually connecting to the IPv6 internet. As a result, servers in this network now try to connect to *.ubuntu.com via its IPv6 address by default when running apt-get.
	# Solution: uncommenting precedence ::ffff:0:0/96 100 allows requests to prefer IPv4

# Edit grub file
# =============================================================================================================
    sudo subl /etc/default/grub
    # do the edit, save
    sudo update-grub

# Adding my own aliases
# =============================================================================================================
    subl ~/.zshrc
    # Paste below at the EOF
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi
    # Save and source the file
    source ~/.zshrc

# Add mvn plugin
# =============================================================================================================
    subl ~/.zshrc
    # Add mvn into 
    plugins=(
      git
      mvn
    )
    # save and source
    # To get colors
    subl ~/.oh-my-zsh/plugins/mvn/mvn.plugin.zsh
    # Uncomment line 41 -> alias mvn="mvn-color"
    # Save and source the file
      
# Open remote files from sublime text 3
# =============================================================================================================
    # On server, Install rsub:
        sudo wget -O /usr/local/bin/rsub \https://raw.github.com/aurora/rmate/master/rmate
        sudo chmod a+x /usr/local/bin/rsub

    # On local, Install rsub Sublime3 package:
        On Sublime Text 3, open Package Manager (Ctrl-Shift-P on Linux/Win, Install Package), and search for rsub and install it

    # Open command line and connect to remote server:
        ssh -R 52698:localhost:52698 server_user@server_address

    # After connecting to the server, run this command on server:
        rsub path_to_file/file.txt
        
# See MySQL vaaraibles by quering.
# =============================================================================================================
    SHOW VARIABLES LIKE '%max%';

# See active mysql connections
# =============================================================================================================
    show status where `variable_name` = 'Threads_connected';

# Flush mysql connections by query
# =============================================================================================================
    FLUSH HOSTS;
