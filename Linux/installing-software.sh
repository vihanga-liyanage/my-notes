
# Install uTorrent Server 3.3
# =============================================================================================================
    # Step 1: Download latest uTorrent Server
        # Note: (You need to download uTorrent Server for 13.04, also works for Ubuntu 14.04)

    # Step 2: Extract uTorrent Files
        # Launch terminal
        # Change directory to Downloads folder
            cd ~/Downloads/
        # Extract uTorrent files to the /opt directory
            sudo tar -xvzf utserver.tar.gz -C /opt/

    # Step 3: Set Permission on uTorrent-server folder
        sudo chmod -R 755 /opt/utorrent-server-alpha-v3_3/

    # Step 4: Set Symbolic link
        sudo ln -s /opt/utorrent-server-alpha-v3_3/utserver /usr/bin/utserver
   
    # Step 5: Start uTorrent
        utserver -settingspath /opt/utorrent-server-alpha-v3_3/
        # Note: If you get an error about libssl.so package missing, then 
        
        # Run the command below to install it:
            sudo apt-get install libssl0.9.8:i386
        # then try starting it again.

    # Step 6: Log into uTorrent
        # Open Firefox/Chrome and browse to the URL
        # localhost:8080/gui
        # The username is admin and leave the password field empty

# Install oracle java 
# =============================================================================================================
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt-get update 
    sudo apt-get install -y oracle-java8-installer

# Install sublime text
# =============================================================================================================
    sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
    sudo apt-get update
    sudo apt-get install sublime-text-installer 

# Install numix icon pack    
# =============================================================================================================
    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update 
    sudo apt-get install numix-icon-theme numix-icon-theme-circle

# Install flat colors
# =============================================================================================================
	sudo add-apt-repository ppa:ravefinity-project/ppa
	sudo apt-get update 
	sudo apt-get install ambiance-flat-colors
	sudo apt-get install radiance-flat-colors

# Install thinkpad T530 finger print reader
# =============================================================================================================
    sudo add-apt-repository -y ppa:fingerprint/fprint
    sudo apt-get update
    sudo apt-get install libfprint0 fprint-demo libpam-fprintd gksu-polkit
    # to enable...
        fprintd-enroll

# Install apache ant
# =============================================================================================================
    sudo apt-get install ant

# Install apache maven
# =============================================================================================================
    sudo apt-get install maven

# Install and config LAMP + phpmyadmin
# =============================================================================================================
    sudo apt-get install apache2
    sudo ufw allow in "Apache Full"
    # Try localhost and apache default page should apear.

    # Add carbon certificate to java cert file -> solution to tomcat ssl exception
    sudo keytool -import -trustcacerts -file ~/Downloads/temp/wso2carbon.crt -alias wso2carbon -keystore /usr/lib/jvm/java-8-oracle/jre/lib/security/cacerts
    # password - "changeit"

    sudo apt-get install -y mysql-server
    sudo mysql_secure_installation 

    sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
    sudo nano /etc/apache2/mods-enabled/dir.conf
    #Get index.php to front in DirectoryIndex directive, save and exit
    sudo service apache2 restart 

    sudo nano /var/www/html/info.php
    # Enter follow, save, and try http://localhost/info.php
        # <?php phpinfo(); ?>
    # Php info page should apear.

    sudo apt-get install phpmyadmin php-mbstring php-gettext
    sudo phpenmod mcrypt
    sudo phpenmod mbstring
    sudo service apache2 restart

    # change php.ini to upload large files
    sudo nano /etc/php/7.0/apache2/php.ini
    # change follow properties
       upload_max_filesize, memory_limit, post_max_size
    # save and restart apache server
    sudo service apache2 restart

# Install and configure tomcat
# =============================================================================================================

    sudo apt-get install tomcat8

    # Let's make a quick change to the Java options that Tomcat uses when it starts. Open the tomcat8 parameters file:
        sudo nano /etc/default/tomcat8

    # Find the JAVA_OPTS line and replace it with the following. Feel free to change the Xmx and MaxPermSize values — these settings affect how much memory Tomcat will use:
        JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"

    # Save and exit.
    # Now restart Tomcat with this command:
        sudo service tomcat8 restart

    # Installing Additional Packages
        sudo apt-get install tomcat8-docs tomcat8-admin tomcat8-examples

    # In order to use the manager webapp installed in Step 3, we must add a login to our Tomcat server. We will do this by editing the tomcat-users.xml #file:
        sudo nano /etc/tomcat8/tomcat-users.xml

    # You will want to add a user who can access the manager-gui and admin-gui
        <tomcat-users>
            <user username="admin" password="admin" roles="manager-gui,admin-gui"/>
        </tomcat-users>

    # Save and quit the tomcat-users.xml file. To put our changes into effect, restart the Tomcat service:
        sudo service tomcat8 restart

    # Access the Web Interface
        http://server_IP_address:8080
    
# Installing node 
# =============================================================================================================
    # Create a new file: 
        sudo touch /etc/apt/sources.list.d/nodesource.list

    # You'll need to create this file with sudo. And when you create the file, put this inside it:

        deb https://deb.nodesource.com/node_6.x xenial main
        deb-src https://deb.nodesource.com/node_6.x xenial main
        
    # Then, save the file. (replace node_6.x with node_7.x or node_8.x, etc. for newer Node versions)
    # Download the GPG Signing Key from Nodesource for the repository. Otherwise, you may get NO_PUBKEY errors with apt-get update:
        curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
    # Run 
        sudo apt-get update

    # This refreshes the data from the nodesource repo so apt knows a newer version exists.

    # If you get a NO_PUBKEY GPG error, then go back to Step 2
    # Check apt-cache policy nodejs output.

    # This is not done by the script, but you want to make sure you see an entry that says something like this in the output:

    # Version table:
        # 6.2.1-1nodesource1~xenial1 500
        #    500 https://deb.nodesource.com/node_6.x xenial/main amd64 Packages
        # 4.2.6~dfsg-1ubuntu4 500
        #    500 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages
    # If you do not see entries like this, and only see 4.2.6, start over. Otherwise, proceed.
    # Install the nodejs binary. Now that you have confirmed 6.x is available on your system, you can install it: 
        sudo apt-get install nodejs
        
        nodejs --version
    # should now show v6.2.1 or similar on output (as long as it starts with v6. you're on version 6 then).

# Installing Oh My ZSH
# =============================================================================================================
    sudo apt-get install zsh
    zsh --version
        # 5.1.1
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # Have to restart in order to take effect

# Install Nginx server
# =============================================================================================================
    sudo apt-get install -y nginx
    # If NO_PUBKEY error occured,
        sudo wget http://nginx.org/packages/keys/nginx_signing.key
        cat nginx_signing.key | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install -y nginx
  