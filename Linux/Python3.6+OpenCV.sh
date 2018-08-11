# Install python 3.6 on ubuntu 12.04
# =============================================================================================================
	# Install Required Packages
		sudo apt-get install build-essential checkinstall
		sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
	# Download Python 3.6.1
		cd /usr/src
		wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz
	# Extract the downloaded package
 		sudo tar xzf Python-3.6.0.tgz
	# Compile Python Source
		cd Python-3.6.0
		sudo ./configure
		sudo make altinstall
	# Check the Python Version
		python3.6 -V

# Install virtualenv and virtualenvwrapper
# =============================================================================================================
	# These packages allow us to create entirely separate and independent Python environments, ensuring that we don’t junk up our system Python install (and more importantly, so we can have a separate Python environment for each of our projects).

		sudo pip3.6 install virtualenv virtualenvwrapper

	# Now we can update our ~/.bashrc  file (place follow at the bottom of the file):
		# virtualenv and virtualenvwrapper
		export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.6
		export WORKON_HOME=$HOME/.virtualenvs
		source /usr/local/bin/virtualenvwrapper.sh

	# Save and run follow to reload file
		source ~/.bashrc

	# Create 'cv' virtual environment
		mkvirtualenv cv

# Install OpenCV
# =============================================================================================================
	# OpenCV represents images as NumPy arrays
		pip install numpy
	